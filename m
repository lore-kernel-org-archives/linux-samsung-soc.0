From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform
 support
Date: Sat, 13 Apr 2013 00:39:24 +0200
Message-ID: <201304130039.24872.heiko@sntech.de>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
 <201304130022.49987.heiko@sntech.de> <7765249.PbghLduf67@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <7765249.PbghLduf67@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, Tomasz Figa <t.figa@samsung.com>, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: linux-samsung-soc@vger.kernel.org

QW0gU2Ftc3RhZywgMTMuIEFwcmlsIDIwMTMsIDAwOjI2OjQzIHNjaHJpZWIgQXJuZCBCZXJnbWFu
bjoKPiBPbiBTYXR1cmRheSAxMyBBcHJpbCAyMDEzIDAwOjIyOjQ4IEhlaWtvIFN0w7xibmVyIHdy
b3RlOgo+ID4gV2l0aG91dCBkdCBzdXBwb3J0LCB5b3UgZ2V0IHRoaXM6Cj4gPiAgIENDICAgICAg
ZHJpdmVycy9jbG9ja3NvdXJjZS9zYW1zdW5nX3B3bS5vCj4gPiAKPiA+IGRyaXZlcnMvY2xvY2tz
b3VyY2Uvc2Ftc3VuZ19wd20uYzo2MjA6IHdhcm5pbmc6Cj4gPiDigJhzYW1zdW5nX3B3bV9jbG9j
a3NvdXJjZV9pbml0X29m4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkCj4gPiAKPiA+IFNvLCBzb21l
dGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nIG1pZ2h0IGJlIG5lY2Vzc2FyeQo+IAo+IFRoYXQgcGF0
Y2ggc2hvdWxkIG5vdCBiZSByZXF1aXJlZCBhbnkgbW9yZSB3aXRoIHRoZSBkZWZpbml0aW9uCj4g
Cj4gI2lmZGVmIENPTkZJR19DTEtTUkNfT0YKPiBleHRlcm4gdm9pZCBjbG9ja3NvdXJjZV9vZl9p
bml0KHZvaWQpOwo+IAo+ICNkZWZpbmUgQ0xPQ0tTT1VSQ0VfT0ZfREVDTEFSRShuYW1lLCBjb21w
YXQsIGZuKSAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9fY2xrc3JjX29mX3RhYmxlXyMjbmFtZSAgICAgICBcCj4gICAg
ICAgICAgICAgICAgIF9fdXNlZCBfX3NlY3Rpb24oX19jbGtzcmNfb2ZfdGFibGUpICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAgPSB7IC5jb21wYXRpYmxlID0gY29tcGF0
LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICAu
ZGF0YSA9IChmbiA9PSAoY2xvY2tzb3VyY2Vfb2ZfaW5pdF9mbilOVUxMKSA/IGZuIDogZm4KPiB9
ICNlbHNlCj4gc3RhdGljIGlubGluZSB2b2lkIGNsb2Nrc291cmNlX29mX2luaXQodm9pZCkge30K
PiAjZGVmaW5lIENMT0NLU09VUkNFX09GX0RFQ0xBUkUobmFtZSwgY29tcGF0LCBmbikgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBfX2Nsa3NyY19vZl90YWJsZV8jI25hbWUgICAgICAgXAo+ICAgICAgICAgICAgICAgICBf
X2F0dHJpYnV0ZV9fKCh1bnVzZWQpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiAgICAgICAgICAgICAgICAgID0geyAuY29tcGF0aWJsZSA9IGNvbXBhdCwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgICAgICAgICAgICAgLmRhdGEgPSAoZm4gPT0g
KGNsb2Nrc291cmNlX29mX2luaXRfZm4pTlVMTCkgPyBmbiA6IGZuCj4gfSAjZW5kaWYKPiAKPiB3
aGljaCB0dXJucyB0aGUg4oCYc2Ftc3VuZ19wd21fY2xvY2tzb3VyY2VfaW5pdF9vZuKAmSBmdW5j
dGlvbiBpbnRvIGFuIHVudXNlZAo+IHN5bWJvbCB0aGF0IGdldHMgc2lsZW50bHkgZHJvcHBlZCBi
eSBnY2MsIGF0IGxlYXN0IGluIHRoZW9yeS4gQXJlIHlvdQo+IHVzaW5nIHRoZSBsYXRlc3QgY2xr
c3JjL2NsZWFudXAgYnJhbmNoIGFzIGEgYmFzZT8KCk5vcGUsIEkganVzdCBwdXQgdGhlIHN0dWZm
IG9uIHRvcCBvZiBhbGwgdGhlIG90aGVyIGNoYW5nZXMuIFNvIGl0IHNlZW1zIApldmVyeXRoaW5n
IGlzIGZpbmUgYW5kIHdvcmtpbmcgLi4uIHZlcnkgbmljZSA6LSkKCgpIZWlrbwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
