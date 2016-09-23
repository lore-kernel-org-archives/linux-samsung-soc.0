From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC] drm/exynos: g2d: runpm fixing attempt
Date: Fri, 23 Sep 2016 17:10:35 +0200
Message-ID: <1474643436-24844-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8sCgpJIGhhdmUgYWxyZWFkeSB0YWxrZWQgdG8gTWFyZWsgaW4gcHJpdmF0ZSBhYm91dCB0
aGlzLiBUaGUgbGF0ZXN0IHJ1bnBtIHBhdGNoIChiMDU5ODRlMjFhN2UwMDBiZjUwNzRhY2UwMGQ3
YTU3NDk0NGIyYzE2KSBjcmlwcGxlcyBHMkQgb3BlcmF0aW9uLiBJIGhhdmUgdHJpZWQgdG8gY29t
ZSB1cCB3aXRoIGEgd2F5IHRvIGZpeCB0aGlzIGFuZCBhbHNvIHRvIGltcHJvdmUgcnVucG0gYmVo
YXZpb3VyIHdoaWxlIGF0IGl0LgoKTWFyZWsgcG9pbnRlZCBvdXQgdGhhdCB0aGUgY3VycmVudCBp
c3N1ZSwgaS5lLiB0aGUgcmVhc29uIGZvciB0aGUgYWZvcmVtZW50aW9uZWQgcGF0Y2gsIGlzIHRo
YXQgc2xlZXAgb3BzIChzdXNwZW5kL3Jlc3VtZSkgYXJlIG5vdyBjYWxsZWQgZHVyaW5nIHJ1bnBt
IHN1c3BlbmQgdGltZS4gSSB0aGluayB0aGF0IG15IGFwcHJvYWNoIHNob3VsZCBoYW5kbGUgdGhp
cyBzaXR1YXRpb24uCgpJbiBhbnkgY2FzZSwgZmVlZGJhY2sgaXMgbXVjaCBhcHByZWNpYXRlZC4K
CldpdGggYmVzdCB3aXNoZXMsClRvYmlhcwoKVG9iaWFzIEpha29iaSAoMSk6CiAgZHJtL2V4eW5v
czogZzJkOiBmaXggcnVudGltZSBQTQoKIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9nMmQuYyB8IDIzNSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE4NiBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
