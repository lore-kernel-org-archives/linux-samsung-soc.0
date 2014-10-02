From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix vblank handling during dpms off
Date: Thu, 02 Oct 2014 13:52:54 +0200
Message-ID: <542D3C96.7000400@samsung.com>
References: <542B9A0E.7020206@samsung.com>
 <1412151287-12845-1-git-send-email-a.hajda@samsung.com>
 <542D13CC.5000304@samsung.com> <542D2E7C.1020904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <542D2E7C.1020904@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgorQ0MgcG9zc2libGUgdmljdGltcwoKT24gMTAvMDIvMjAxNCAxMjo1MiBQTSwgSW5raSBE
YWUgd3JvdGU6Cj4gT24gMjAxNOuFhCAxMOyblCAwMuydvCAxNzo1OCwgSm9vbnlvdW5nIFNoaW0g
d3JvdGU6Cj4+IEhpIEFuZHJ6ZWosCj4+Cj4+IE9uIDEwLzAxLzIwMTQgMDU6MTQgUE0sIEFuZHJ6
ZWogSGFqZGEgd3JvdGU6Cj4+PiBUaGUgcGF0Y2ggZGlzYWJsZXMgdmJsYW5rcyBkdXJpbmcgZHBt
cyBvZmYgb25seSBpZiBwYWdlZmlscCBoYXMKPj4+IG5vdCBiZWVuIGZpbmlzaGVkLiBJdCBhbHNv
IHJlcGxhY2VzIGRybV92Ymxhbmtfb2ZmIHdpdGggZHJtX2NydGNfdmJsYW5rX3B1dC4KPj4+IEl0
IGZpeGVzIGlzc3VlIHdpdGggcGFnZV9mbGlwIGlvY3RsIG5vdCBiZWluZyBhYmxlIHRvIGFjcXVp
cmUgdmJsYW5rIGNvdW50ZXIuCj4+IFRoaXMgcHJvYmxlbSBpc24ndCByZWxhdGVkIHdpdGggcGFn
ZWZsaXAsIGl0IGp1c3QgY2F1c2VzIGZyb20KPj4gN2ZmZDdhNjg1MTFjNzEwYjg0ZGIzNTQ4YTE5
OTdmZDI2MjVmNTgwYSBjb21taXQgKGRybTogQWx3YXlzIHJlamVjdAo+PiBkcm1fdmJsYW5rX2dl
dCgpIGFmdGVyIGRybV92Ymxhbmtfb2ZmKCkpLgo+Pgo+PiBXZSBuZWVkIHRvIHVzZSBkcm1fdmJs
YW5rX29uKCkgYXMgYSBjb3VudGVycGFydCB0byBkcm1fdmJsYW5rX29mZigpCj4+IGFmdGVyIHRo
ZSBjb21taXQgLgoKVGhpcyBwYXRjaCBzaG91bGQgYnJlYWsgYWxzbyBvdGhlciBkcml2ZXJzLCBp
dCBzZWVtcyBhdCBsZWFzdCBmb2xsb3dpbmcKZHJtcyBjb3VsZCBiZSBhZmZlY3RlZDoKYXJtYWRh
LCBzdGksIHRlZ3JhLgoKSSBndWVzcyBhZnRlciBkaXNhYmxpbmcgYW5kIHJlLWVuYWJsaW5nIGNy
dGMgdmJsYW5rcyBzaG91bGQgc3RvcAp3b3JraW5nLCB1bmxlc3MgdGhlcmUgYXJlIG90aGVyIGJ1
Z3MuCgpSZWdhcmRzCkFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
