From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 6/6] drm/exynos: do not copy adjusted mode into mode
 during crtc mode_set
Date: Tue, 3 Feb 2015 12:16:18 -0200
Message-ID: <20150203141618.GB2122@joana>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-6-git-send-email-gustavo@padovan.org>
 <54CB0E40.1020400@samsung.com> <20150130144420.GE30820@joana>
 <54CF035F.2050502@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <54CF035F.2050502@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNS0wMi0wMiBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+OgoKPiBI
aSwKPiAKPiBPbiAwMS8zMC8yMDE1IDExOjQ0IFBNLCBHdXN0YXZvIFBhZG92YW4gd3JvdGU6Cj4g
PiBIaSBKb29ueW91bmcsCj4gPiAKPiA+IDIwMTUtMDEtMzAgSm9vbnlvdW5nIFNoaW0gPGp5MDky
Mi5zaGltQHNhbXN1bmcuY29tPjoKPiA+IAo+ID4+IEhpLAo+ID4+Cj4gPj4gT24gMDEvMjMvMjAx
NSAwOTo0MyBQTSwgR3VzdGF2byBQYWRvdmFuIHdyb3RlOgo+ID4+PiBGcm9tOiBEYW5pZWwgS3Vy
dHogPGRqa3VydHpAY2hyb21pdW0ub3JnPgo+ID4+Pgo+ID4+PiBUaGUgJ21vZGUnIGlzIHRoZSBt
b2RlbGluZSBpbmZvcm1hdGlvbiB3aGljaCBzcGVjaWZpZXMgdGhlIGlkZWFsIG1vZGUKPiA+Pj4g
cmVxdWVzdGVkIGJ5IHRoZSBtb2RlIHNldCBpbml0aWF0b3IgKHVzdWFsbHkgdXNlcnNwYWNlKS4K
PiA+Pj4gVGhlICdhZGp1c3RlZF9tb2RlJyBpcyB0aGUgYWN0dWFsIGhhcmR3YXJlIG1vZGUgYWZ0
ZXIgYWxsIHRoZSBjcnRjcwo+ID4+PiBhbmQgZW5jb2RlcnMgaGF2ZSBoYWQgYSBjaGFuY2UgdG8g
ImZpeCBpdCB1cCIuCj4gPj4+Cj4gPj4+IFRoZSBhZGp1c3RlZF9tb2RlIHN0YXJ0cyBhcyBhIGR1
cGxpY2F0ZSBvZiB0aGUgbW9kZSBpbgo+ID4+PiBkcm1fY3J0Y19oZWxwZXJfc2V0X21vZGUoKSwg
YW5kIGdldHMgbW9kaWZpZWQgYXMgcmVxdWlyZWQuICBUaGVyZSBpcyBubwo+ID4+PiByZWFzb24g
dG8gdG91Y2ggdGhlIG9yaWdpbmFsIHJlcXVlc3RlZCBtb2RlLgo+ID4+Pgo+ID4+Cj4gPj4gQWdy
ZWUsIGJ1dCBpcyB0aGVyZSBhbnkgc2lkZSBlZmZlY3QgYWZ0ZXIgdGhpcyBjb21taXQ/IFNob3Vs
ZCB3ZSBzYXZlCj4gPj4gYWRqdXN0ZWRfbW9kZSB0byBvdGhlciB2YXJpYWJsZSBhbmQgdXNlIGl0
Pwo+ID4gCj4gPiBJIGhhdmVuJ3Qgc2VlbiBhbnkuIFRlc3RlZCBvbiBwZWFjaCBwaSBhbmQgc25v
dy4gRG8gd2UgaGF2ZSBhbnkgcmVhc29uIHRvIHNhdmUKPiA+IGl0IG5vdz8gSSBkb24ndCB3ZSBo
YXZlIGEgdXNlciBmb3IgaXQgbm93Lgo+ID4gCj4gCj4gQmVjYXVzZSBjdXJyZW50IGNvZGVzIHVz
ZSB2YWx1ZXMgb2YgYWRqdXN0ZWRfbW9kZSBpbiBleHlub3MgZHJtIGh3IGRyaXZlcnMuCgpJIGZh
aWwgdG8gc2VlIHdoZXJlIHRoaXMgaGFwcGVuLiBhZGp1c3RlZF9tb2RlIGlzIHBhc3NlZCB0byB0
byB0aGUgbW9kZV9zZXQoKQpjYWxsYmFjayBhbmQgZHJpdmVycyBjYW4gdXNlIGl0IGZyb20gdGhl
cmUgYXMgdGhlIGhkbWkgb25lIGRvZXMgZm9yIGV4YW1wbGUuCgoJR3VzdGF2bwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
