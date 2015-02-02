From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 6/6] drm/exynos: do not copy adjusted mode into mode during
 crtc mode_set
Date: Mon, 02 Feb 2015 13:55:59 +0900
Message-ID: <54CF035F.2050502@samsung.com>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-6-git-send-email-gustavo@padovan.org>
 <54CB0E40.1020400@samsung.com> <20150130144420.GE30820@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20150130144420.GE30820@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Daniel Kurtz <djkurtz@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAwMS8zMC8yMDE1IDExOjQ0IFBNLCBHdXN0YXZvIFBhZG92YW4gd3JvdGU6Cj4gSGkg
Sm9vbnlvdW5nLAo+IAo+IDIwMTUtMDEtMzAgSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNh
bXN1bmcuY29tPjoKPiAKPj4gSGksCj4+Cj4+IE9uIDAxLzIzLzIwMTUgMDk6NDMgUE0sIEd1c3Rh
dm8gUGFkb3ZhbiB3cm90ZToKPj4+IEZyb206IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBjaHJvbWl1
bS5vcmc+Cj4+Pgo+Pj4gVGhlICdtb2RlJyBpcyB0aGUgbW9kZWxpbmUgaW5mb3JtYXRpb24gd2hp
Y2ggc3BlY2lmaWVzIHRoZSBpZGVhbCBtb2RlCj4+PiByZXF1ZXN0ZWQgYnkgdGhlIG1vZGUgc2V0
IGluaXRpYXRvciAodXN1YWxseSB1c2Vyc3BhY2UpLgo+Pj4gVGhlICdhZGp1c3RlZF9tb2RlJyBp
cyB0aGUgYWN0dWFsIGhhcmR3YXJlIG1vZGUgYWZ0ZXIgYWxsIHRoZSBjcnRjcwo+Pj4gYW5kIGVu
Y29kZXJzIGhhdmUgaGFkIGEgY2hhbmNlIHRvICJmaXggaXQgdXAiLgo+Pj4KPj4+IFRoZSBhZGp1
c3RlZF9tb2RlIHN0YXJ0cyBhcyBhIGR1cGxpY2F0ZSBvZiB0aGUgbW9kZSBpbgo+Pj4gZHJtX2Ny
dGNfaGVscGVyX3NldF9tb2RlKCksIGFuZCBnZXRzIG1vZGlmaWVkIGFzIHJlcXVpcmVkLiAgVGhl
cmUgaXMgbm8KPj4+IHJlYXNvbiB0byB0b3VjaCB0aGUgb3JpZ2luYWwgcmVxdWVzdGVkIG1vZGUu
Cj4+Pgo+Pgo+PiBBZ3JlZSwgYnV0IGlzIHRoZXJlIGFueSBzaWRlIGVmZmVjdCBhZnRlciB0aGlz
IGNvbW1pdD8gU2hvdWxkIHdlIHNhdmUKPj4gYWRqdXN0ZWRfbW9kZSB0byBvdGhlciB2YXJpYWJs
ZSBhbmQgdXNlIGl0Pwo+IAo+IEkgaGF2ZW4ndCBzZWVuIGFueS4gVGVzdGVkIG9uIHBlYWNoIHBp
IGFuZCBzbm93LiBEbyB3ZSBoYXZlIGFueSByZWFzb24gdG8gc2F2ZQo+IGl0IG5vdz8gSSBkb24n
dCB3ZSBoYXZlIGEgdXNlciBmb3IgaXQgbm93Lgo+IAoKQmVjYXVzZSBjdXJyZW50IGNvZGVzIHVz
ZSB2YWx1ZXMgb2YgYWRqdXN0ZWRfbW9kZSBpbiBleHlub3MgZHJtIGh3IGRyaXZlcnMuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
