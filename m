From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 06/20] drm: i915: Rely on the default
 ->best_encoder() behavior where appropriate
Date: Fri, 10 Jun 2016 18:41:52 +0200
Message-ID: <20160610164152.GO3363@phenom.ffwll.local>
References: <1465300095-16971-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465300095-16971-7-git-send-email-boris.brezillon@free-electrons.com>
 <20160610152412.GL3363@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160610152412.GL3363@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, Alexey Brodkin <abrodkin@synopsys.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@snte>
List-Id: linux-samsung-soc@vger.kernel.org

T24gRnJpLCBKdW4gMTAsIDIwMTYgYXQgMDU6MjQ6MTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAwNywgMjAxNiBhdCAwMTo0ODowMVBNICswMjAwLCBCb3JpcyBC
cmV6aWxsb24gd3JvdGU6Cj4gPiBGb3IgYWxsIG91dHB1dHMgZXhjZXB0IGRwX21zdCwgd2UgaGF2
ZSBhIDE6MSByZWxhdGlvbnNoaXAgYmV0d2Vlbgo+ID4gY29ubmVjdG9ycyBhbmQgZW5jb2RlcnMg
YW5kIHRoZSBkcml2ZXIgaXMgcmVseWluZyBvbiB0aGUgYXRvbWljIGhlbHBlcnM6Cj4gPiB3ZSBj
YW4gZHJvcCB0aGUgY3VzdG9tIC0+YmVzdF9lbmNvZGVyKCkgaW1wbGVtZW50YXRpb24gYW5kIGxl
dCB0aGUgY29yZQo+ID4gY2FsbCBkcm1fYXRvbWljX2hlbHBlcl9iZXN0X2VuY29kZXIoKSBmb3Ig
dXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemls
bG9uQGZyZWUtZWxlY3Ryb25zLmNvbT4KPiAKPiBZb3UgY2FuIGFsc28gZHJvcCB0aGUgYmVzdF9l
bmNvZGVyIGZyb20gaW50ZWxfZHBfbXN0LCB3ZSBvbmx5IG5lZWQgdGhlCj4gYXRvbWljX2Jlc3Rf
ZW5jb2Rlci4gVGhlIGJlc3RfZW5jb2RlciB0aGVyZSB3YXMgbmVlZGVkIHRvIGhlbHAgb3V0IHRo
ZQo+IGZiZGV2IGVtdWxhdGlvbi4gQ2FyZSB0byByZXNwaW4/CgpCb3JpcyBwb2ludGVkIG91dCBv
biBpcmMgdGhhdCB0aGlzIHdvbid0IHdvcmsgZm9yIHRoZSBmYmRldiBzdHVmZiBzaW5jZQp0aGF0
IGhhcyBhIFdBUk5fT04gaWYgdGhlcmVzIG1vcmUgdGhhbiAxIHBvc3NpYmxlIGVuY29kZXIuIEFw
cGxpZWQgdGhpcwpvbmUgaGVyZSBpbnN0ZWFkLgoKVGhhbmtzLCBEYW5pZWwKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCklu
dGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
