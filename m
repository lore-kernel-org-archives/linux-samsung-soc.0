From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 11/11] dt-bindings: analogix_dp: rockchip: correct the
 wrong compatible name
Date: Wed, 29 Jun 2016 17:16:13 +0800
Message-ID: <1467191773-17566-1-git-send-email-ykk@rock-chips.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

VGhlIGRvY3VtZW50IGFib3V0IHJvY2tjaGlwIHBsYXRmb3JtIG1ha2UgYSBtaXN0YWtlbiBpbiBh
dmFpbGFibGUKY29tcGF0aWJsZSBuYW1lIG9mICJyazMyODgtZWRwIiwgd2Ugc2hvdWxkIGNvcnJl
Y3QgaXQgdG8gInJrMzI4OC1kcCIKd2hpY2ggY29ycmVzcG9uZCB0byB0aGUgY29tcGF0aWJsZSBu
YW1lIGluIGRyaXZlci4KClRoaXMgbWlzdGFrZW4gd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IGJl
OTFjMzYyNDcwODkgKCJkdC1iaW5kaW5nczoKYWRkIGRvY3VtZW50IGZvciByb2NrY2hpcCB2YXJp
YW50IG9mIGFuYWxvZ2l4X2RwIikuCgpSZXBvcnRlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNo
cm9taXVtLmNvbT4KU2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29t
PgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpS
ZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGNocm9taXVtLmNvbT4KLS0tCkNo
YW5nZXMgaW4gdjQ6Ci0gQWRkIHJldmlld2VkIGZsYWcgZnJvbSBEb3VnLgotIEFkZCByZXZpZXdl
ZCBmbGFnIGZyb20gVG9tYXN6LgoKQ2hhbmdlcyBpbiB2MzoKLSBBZGQgdGhpcyBwYXRjaCBpbiB2
MwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvYW5hbG9naXhfZHAt
cm9ja2NoaXAudHh0ICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvYW5hbG9naXhfZHAt
cm9ja2NoaXAudHh0CmluZGV4IDBiMzkyNTYuLjAxY2NlZDEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJv
Y2tjaGlwLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC50eHQKQEAgLTIsNyArMiw3IEBAIFJvY2tj
aGlwIFJLMzI4OCBzcGVjaWZpYyBleHRlbnNpb25zIHRvIHRoZSBBbmFsb2dpeCBEaXNwbGF5IFBv
cnQKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIFJlcXVpcmVkIHByb3BlcnRp
ZXM6Ci0tIGNvbXBhdGlibGU6ICJyb2NrY2hpcCxyazMyODgtZWRwIiwKKy0gY29tcGF0aWJsZTog
InJvY2tjaGlwLHJrMzI4OC1kcCIsCiAJICAgICAgInJvY2tjaGlwLHJrMzM5OS1lZHAiOwogCiAt
IHJlZzogcGh5c2ljYWwgYmFzZSBhZGRyZXNzIG9mIHRoZSBjb250cm9sbGVyIGFuZCBsZW5ndGgK
LS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
