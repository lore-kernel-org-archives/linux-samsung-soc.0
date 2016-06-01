From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/3] drm/exynos: fimd: add HW trigger support
Date: Wed, 1 Jun 2016 09:13:52 -0400
Message-ID: <ed8ec6fb-3a3c-2ecb-8e9c-297db68bb38f@osg.samsung.com>
References: <1459844864-12065-1-git-send-email-inki.dae@samsung.com>
 <1459844864-12065-3-git-send-email-inki.dae@samsung.com>
 <CGME20160530225859epcas1p1cd4e0ee36c138ad9ea17f3f5885e8cdb@epcas1p1.samsung.com>
 <a8e410dd-ef60-f8cd-f4ea-cf60414db5bd@osg.samsung.com>
 <574E7914.3020201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <574E7914.3020201@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSW5raSwKCk9uIDA2LzAxLzIwMTYgMDE6NTYgQU0sIElua2kgRGFlIHdyb3RlOgo+IEhp
IEphdmllciwKPiAKPiAyMDE264WEIDA17JuUIDMx7J28IDA3OjU47JeQIEphdmllciBNYXJ0aW5l
eiBDYW5pbGxhcyDsnbQo6rCAKSDsk7Qg6riAOgo+PiBIZWxsbyBJbmtpLAo+Pgo+PiBPbiAwNC8w
NS8yMDE2IDA0OjI3IEFNLCBJbmtpIERhZSB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggYWRkcyBIVyB0
cmlnZ2VyIHN1cHBvcnQgb24gaTgwIG1vZGUuCj4+Pgo+Pj4gVW50aWwgbm93LCBFeHlub3MgRFJN
IG9ubHkgc3VwcG9ydGVkIFNXIHRyaWdnZXIgd2hpY2ggd2FzIHNldAo+Pj4gU1dUUkdDTUQgYml0
IG9mIFRSSUdDT04gcmVnaXN0ZXIgYnkgQ1BVIHRvIHRyYW5zZmVyIHNjYW5vdXQKPj4+IGJ1ZmZl
ciB0byBEaXNwbGF5IGJ1cyBkZXZpY2Ugb3IgcGFuZWwuCj4+Pgo+Pj4gV2l0aCB0aGlzIHBhdGNo
LCB0aGUgdHJhbnNtaXNzaW9uIHRvIERpc3BsYXkgYnVzIGRldmljZSBvcgo+Pj4gcGFuZWwgd2ls
bCBiZSBpbml0aWF0ZWQgYnkgRklNRCBjb250cm9sbGVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPj4+IC0tLQo+Pgo+PiBUaGVyZSBpcyBh
IHJlZ3Jlc3Npb24gZm9yIHRoZSBFeHlub3M1ODAwIFBlYWNoIFBpIENocm9tZWJvb2sgZGlzcGxh
eSBkdWUKPj4gdGhpcyBwYXRjaC4gVGhlIGRpc3BsYXkgaXMgYmxhbmsgYW5kIEkgbm90aWNlZCB0
aGF0IGl0IG9ubHkgaGFwcGVucyB3aGVuCj4+IEhXIHN0YXJ0IHRyaWdnZXIgaXMgZW5hYmxlZCwg
YnV0IHdvcmtzIHdpdGggU1cgdHJpZ2dlciAoYXMgaXQgd2FzIGJlZm9yZSkuCj4gCj4gUG9zdGVk
IGJlbG93IHBhdGhjaCwKPiBbUEFUQ0hdIGRybS9leHlub3M6IGZpbWQ6IGZpeCB0cmlnZ2VyIG1v
ZGUgY2hhbmdlIHJlZ3Jlc3Npb24KPgoKVGhhbmtzLCBJIG5vdGljZWQgeW91IGZvcmdvdCB0byBj
YyBtZSBvbiB0aGF0IG9uZSB0aG91Z2guCiAKPiBDYW4geW91IHRlc3QgaXQgYWdhaW4gd2l0aCB0
aGUgcGF0Y2g/IEkgaGF2ZSBubyBIVyB0byB0ZXN0IGl0LiA6KAo+CgpJIGdhdmUgYSB0cnkgdG8g
eW91ciBwYXRjaCBidXQgdW5mb3J0dW5hdGVseSBpdCBkb2Vzbid0IHNvbHZlIHRoZSBpc3N1ZQpv
biB0aGUgUGVhY2ggUGkuIEknbGwgdHJ5IHRvIGRpZyBmdXJ0aGVyIG9uIHRoaXMuCiAKPiBUaGFu
a3MsCj4gSW5raSBEYWUKPiAKCkJlc3QgcmVnYXJkcywKLS0gCkphdmllciBNYXJ0aW5leiBDYW5p
bGxhcwpPcGVuIFNvdXJjZSBHcm91cApTYW1zdW5nIFJlc2VhcmNoIEFtZXJpY2EKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
