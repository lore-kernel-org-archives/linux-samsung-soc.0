From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 03/10] drm/bridge: analogix_dp: correct the register bit
 define error in ANALOGIX_DP_PLL_REG_1
Date: Tue, 24 May 2016 13:02:19 +0800
Message-ID: <1464066139-22648-1-git-send-email-ykk@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlcmUncmUgYW4gcmVnaXN0ZXIgZGVmaW5lIGVycm9yIGluIEFOQUxPR0lYX0RQX1BMTF9SRUdf
MSB3aGljaCBpbnRyb2R1Y2VkCmJ5IGNvbW1pdCBiY2VjMjBmZDVhZDYgKCJkcm06IGJyaWRnZTog
YW5hbG9naXgvZHA6IGFkZCBzb21lIHJrMzI4OCBzcGVjaWFsCnJlZ2lzdGVycyBzZXR0aW5nIiku
CgpUaGUgUEhZIFBMTCBpbnB1dCBjbG9jayBzb3VyY2UgaXMgc2VsZWN0ZWQgYnkgQU5BTE9HSVhf
RFBfUExMX1JFR18xCkJJVCAwLCBub3QgQklUIDEuCgpTaWduZWQtb2ZmLWJ5OiBZYWtpciBZYW5n
IDx5a2tAcm9jay1jaGlwcy5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOiBOb25lCgogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuaCB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX3JlZy5oIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9yZWcuaAppbmRleCAzMzc5MTJi
Li44OGQ1NmFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2Fu
YWxvZ2l4X2RwX3JlZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5h
bG9naXhfZHBfcmVnLmgKQEAgLTE2Myw4ICsxNjMsOCBAQAogI2RlZmluZSBIU1lOQ19QT0xBUklU
WV9DRkcJCQkoMHgxIDw8IDApCiAKIC8qIEFOQUxPR0lYX0RQX1BMTF9SRUdfMSAqLwotI2RlZmlu
ZSBSRUZfQ0xLXzI0TQkJCQkoMHgxIDw8IDEpCi0jZGVmaW5lIFJFRl9DTEtfMjdNCQkJCSgweDAg
PDwgMSkKKyNkZWZpbmUgUkVGX0NMS18yNE0JCQkJKDB4MSA8PCAwKQorI2RlZmluZSBSRUZfQ0xL
XzI3TQkJCQkoMHgwIDw8IDApCiAKIC8qIEFOQUxPR0lYX0RQX0xBTkVfTUFQICovCiAjZGVmaW5l
IExBTkUzX01BUF9MT0dJQ19MQU5FXzAJCQkoMHgwIDw8IDYpCi0tIAoxLjkuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
