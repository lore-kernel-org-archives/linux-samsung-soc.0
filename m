From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: reserved_mem: restore old behavior when no region is
 defined
Date: Wed, 8 Jun 2016 08:05:56 -0500
Message-ID: <CAL_JsqKNpx09UFkGB0n9W0GkAv8OVUdRN8cYriau83SdD6xnuw@mail.gmail.com>
References: <20160607143425.GE1165@e106497-lin.cambridge.arm.com>
 <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465368713-17866-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Liviu Dudau <liviu.dudau@arm.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkLCBKdW4gOCwgMjAxNiBhdCAxOjUxIEFNLCBNYXJlayBTenlwcm93c2tpCjxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+IENoYW5nZSByZXR1cm4gdmFsdWUgYmFjayB0byAt
RU5PREVWIHdoZW4gbm8gcmVnaW9uIGlzIGRlZmluZWQgZm9yIGdpdmVuCj4gZGV2aWNlLiBUaGlz
IHJlc3RvcmVzIG9sZCBiZWhhdmlvciBvZiB0aGlzIGZ1bmN0aW9uLCBhcyBzb21lIGRyaXZlcnMg
cmVseQo+IG9uIHN1Y2ggZXJyb3IgY29kZS4KPgo+IFJlcG9ydGVkLWJ5OiBMaXZpdSBEdWRhdSA8
bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiBGaXhlczogNTljZTQwMzk3MjdlZjQwICgib2Y6IHJlc2Vy
dmVkX21lbTogYWRkIHN1cHBvcnQgZm9yIHVzaW5nIG1vcmUgdGhhbgo+ICAgICAgICBvbmUgcmVn
aW9uIGZvciBnaXZlbiBkZXZpY2UiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9vZi9vZl9yZXNlcnZl
ZF9tZW0uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
