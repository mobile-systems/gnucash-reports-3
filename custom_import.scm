;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; transaction-report.scm : Report on all transactions in account(s)
;;
;; Original report by Robert Merkel <rgmerk@mira.net>
;; Contributions by Bryan Larsen <blarsen@ada-works.com>
;; More contributions for new report generation code by Robert Merkel
;; More contributions by Christian Stimming <stimming@tuhh.de>
;; Modified to support the intersection of two account lists by
;; Michael T. Garrison Stuber
;; Modified account names display by Tomas Pospisek
;; <tpo_deb@sourcepole.ch> with a lot of help from "warlord"
;; Modifications for supporting Swedish accounting standards by
;; Jonatan Wentzel <jonatan.wentzel@gmail.com>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, contact:
;;
;; Free Software Foundation           Voice:  +1-617-542-5942
;; 51 Franklin Street, Fifth Floor    Fax:    +1-617-542-2652
;; Boston, MA  02110-1301,  USA       gnu@gnu.org
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-module (custom_import))
; must load the module once at the top level to get the symbols
(use-modules (custom_import_renderer))


; get and reload the module
(define (reload-report-module)
  (reload-module (resolve-module '(custom_import_renderer))))
; reload and run options from the module
(define (options_loader)
  (reload-report-module)
  (custom_import_options))
; reload and run renderer from the module
(define (renderer_loader report-obj)
  (reload-report-module)
  (custom_import_renderer report-obj))

(gnc:define-report
        'version 1

        'name (N_ "JWAB")
        'report-guid "2fe3b9222333222fb929a88d5a50020f"

;        'menu-name (N_ "Sample Report with Examples")
        'menu-tip (N_ "Unstable. Used for Testing.")

        ; called when opened, close and reopen to reload
        'options-generator options_loader
        ; called when opened or reloaded
        'renderer renderer_loader)
