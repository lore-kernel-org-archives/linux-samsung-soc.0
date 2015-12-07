From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 4/4] ARM: dts: Use OF graph for DP to panel connection in
 exynos5800-peach-pi
Date: Mon, 7 Dec 2015 10:41:12 -0300
Message-ID: <56658C78.8090509@osg.samsung.com>
References: <1449492758-19989-1-git-send-email-inki.dae@samsung.com>
 <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1449492758-19989-5-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSW5raSwKCk9uIDEyLzA3LzIwMTUgMDk6NTIgQU0sIElua2kgRGFlIHdyb3RlOgo+IEZy
b206IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVyQG9zZy5zYW1zdW5nLmNvbT4KPgoK
VGhhbmtzIGEgbG90IGZvciBwb3N0aW5nIHRoaXMgcGF0Y2guCiAKPiBUaGUgRFQgYmluZGluZyBm
b3IgdGhlIEV4eW5vcyBEUk0gRGlzcGxheSBQb3J0IChEUCkgZHJpdmVyIGlzbid0IGNvbnNpc3Rl
bnQKPiBzaW5jZSBpdCB1c2VzIGEgcGhhbmRsZSB0byBkZXNjcmliZSB0aGUgY29ubmVjdGlvbiBi
ZXR3ZWVuIHRoZSBEUCBwb3J0IGFuZAo+IHRoZSBkaXNwbGF5IHBhbmVsIGJ1dCB1c2VzIHRoZSBP
RiBncmFwaCBwb3J0cyBhbmQgZW5kcG9pbnRzIHRvIGRlc2NyaWJlIHRoZQo+IGNvbm5lY3Rpb24g
YmV0d2VuIHRoZSBEUCBwb3J0LCBhIGJyaWRnZSBjaGlwIGFuZCB0aGUgcGFuZWwuCj4gCj4gVGhl
IEV4eW5vcyBEUCBkcml2ZXIgYW5kIHRoZSBEVCBiaW5kaW5nIGhhdmUgYmVlbiBjaGFuZ2VkIHRv
IGFsbG93IGFsc28gdG8KPiBkZXNjcmliZSB0aGUgRFAgcG9ydCB0byBwYW5lbCBjb25uZWN0aW9u
IHVzaW5nIHBvcnRzIC8gZW5kcG9pbnRzIChPRiBncmFwaCkKPiBzbyB0aGlzIHBhdGNoIGNoYW5n
ZXMgdGhlIEV4eW5vczU4MDAgUGVhY2ggUGkgRFQgdG8gbWFrZSBpdCBjb25zaXN0ZW50IHdpdGgK
PiB0aGUgRXh5bm9zNTQyMCBQZWFjaCBQaXQgdGhhdCBoYXMgYSBlRFAgdG8gTFZEUyBjaGlwIGFu
ZCB1c2VzIE9GIGdyYXBoIHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+Cj4gVGVzdGVkLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+CgpUaGlzIHRhZyB3YXMgbm90
IGluIG15IG9yaWdpbmFsIHBhdGNoLCBpdCdzIHRydWUgdGhhdCBJIHRlc3RlZAppdCBidXQgd2ls
bCBzb21lb25lIGJlbGlldmUgbWU/IDspCgo+IFJldmlld2VkLWJ5OiBJbmtpIERhZSA8aW5raS5k
YWVAc2Ftc3VuZy5jb20+CgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpCZXN0IHJlZ2FyZHMsCi0t
IApKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMKT3BlbiBTb3VyY2UgR3JvdXAKU2Ftc3VuZyBSZXNl
YXJjaCBBbWVyaWNhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
