From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v10 17/17] drm: bridge: analogix/dp: expand the look time for
 waiting AUX CH reply
Date: Mon,  7 Dec 2015 14:41:06 +0800
Message-ID: <1449470466-31649-1-git-send-email-ykk@rock-chips.com>
References: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, javier@osg.samsung.com, emil.l.velikov@gmail.com, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

QWZ0ZXIgdGVzdCBvbiByb2NrY2hpb3AgcGxhdGZvcm0sIGkgZm91bmQgc29tZXRpbXMgZHJpdmVy
IHdvdWxkIGZhaWxlZAphdCByZWFkaW5nIEVESUQgbWVzc2FnZS4gQWZ0ZXIgZGVidWdnaW5nIG1v
cmUsIGkgZm91bmQgdGhhdCBpdCdzIG9rYXkKdG8gcmVhZF9hIGJ5dGUgZnJvbSBpMmMsIGJ1dCBp
dCB3b3VsZCBmYWlsZWQgYXQgQVVYIHRyYW5zY2F0aW9uIGlmIHdlCnRyeSB0byByZWFkeSBtdWx0
aS1ieXRlcyBmcm9tIGkyYy4KCkRyaXZlciBqdXN0IGNhbid0IHJlY2VpdmVkIHRoZSBBVVggQ0gg
cmVwbHkgY29tbWFuZCwgZXZlbiBubyBBVVggZXJyb3IKY29kZS4gSSBtYXkgZ3Vlc3MgdGhhdCB0
aGUgQVVYIHdhaXQgdGltZSBpcyBub3QgZW5vdWdoLCBzbyBJIHRyeSB0bwpleHBhbmQgdGhlIEFV
WCB3YWl0IHRpbWUsIGFuZCBpIGRvIHNlZSB0aGlzIGNvdWxkIGZpeCB0aGUgRURJRCByZWFkCmZh
aWxlZCBhdCByb2NrY2hpcCBwbGF0Zm9ybS4KCkFuZCBJIHRob3VnaHQgdGhhdCBleHBhbmQgdGhl
IHdhaXQgdGltZSB3b24ndCBodXJ0IEV4eW5vcyBwbGF0Zm9ybSB0b28KbXVjaCwgY2F1c2UgRXh5
bm9zIGRpZG4ndCBoYXZlIHRoaXMgcHJvYmxlbSwgdGhlbiBkcml2ZXIgd291bGQgcmVjZWl2ZWQK
dGhlIHJlcGx5IGNvbW1hbmQgdmVyeSBzb29uLCBzbyBubyBtb3JlIGFkZGl0aW9uYWwgd2FpdCB0
aW1lIHdvdWxkIGJyaW5nCnRvIEV4eW5vcyBwbGF0Zm9ybS4KClNpZ25lZC1vZmYtYnk6IFlha2ly
IFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjEwOiBOb25lCkNoYW5n
ZXMgaW4gdjk6IE5vbmUKQ2hhbmdlcyBpbiB2ODogTm9uZQpDaGFuZ2VzIGluIHY3OiBOb25lCkNo
YW5nZXMgaW4gdjY6IE5vbmUKQ2hhbmdlcyBpbiB2NTogTm9uZQpDaGFuZ2VzIGluIHY0OiBOb25l
CkNoYW5nZXMgaW4gdjM6IE5vbmUKQ2hhbmdlcyBpbiB2MjogTm9uZQoKIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfcmVnLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuYwppbmRleCBjN2UyOTU5Li5kYzM3NmJk
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2Rw
X3JlZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
cmVnLmMKQEAgLTQ4Miw3ICs0ODIsNyBAQCBpbnQgYW5hbG9naXhfZHBfc3RhcnRfYXV4X3RyYW5z
YWN0aW9uKHN0cnVjdCBhbmFsb2dpeF9kcF9kZXZpY2UgKmRwKQogCXJlZyA9IHJlYWRsKGRwLT5y
ZWdfYmFzZSArIEFOQUxPR0lYX0RQX0lOVF9TVEEpOwogCXdoaWxlICghKHJlZyAmIFJQTFlfUkVD
RUlWKSkgewogCQl0aW1lb3V0X2xvb3ArKzsKLQkJaWYgKERQX1RJTUVPVVRfTE9PUF9DT1VOVCA8
IHRpbWVvdXRfbG9vcCkgeworCQlpZiAoRFBfVElNRU9VVF9MT09QX0NPVU5UICogMTAgPCB0aW1l
b3V0X2xvb3ApIHsKIAkJCWRldl9lcnIoZHAtPmRldiwgIkFVWCBDSCBjb21tYW5kIHJlcGx5IGZh
aWxlZCFcbiIpOwogCQkJcmV0dXJuIC1FVElNRURPVVQ7CiAJCX0KLS0gCjEuOS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
