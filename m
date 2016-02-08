From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/exynos: dp: Fix panel and bridge lookup logic
Date: Mon, 8 Feb 2016 09:03:36 -0300
Message-ID: <56B88418.7090106@osg.samsung.com>
References: <1454080171-23769-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454080171-23769-1-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gSW5raSwKCk9uIDAxLzI5LzIwMTYgMTI6MDkgUE0sIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyB3cm90ZToKPiBDb21taXQgYTlmYTg1Mjg4NmZkICgiZHJtL2V4eW5vczogZHA6IGFkZCBv
Zl9ncmFwaCBkdCBiaW5kaW5nIHN1cHBvcnQKPiBmb3IgcGFuZWwiKSBtYWRlIHRoZSBFeHlub3Mg
RFAgRFQgYmluZGluZyBtb3JlIGNvbnNpc3RlbnQgc2luY2UgdGhlIE9GCj4gZ3JhcGggY291bGQg
YmUgdXNlZCB0byBsb29rdXAgZWl0aGVyIGEgcGFuZWwgb3IgYSBicmlkZ2UgZGV2aWNlIG5vZGUu
Cj4KPiBCZWZvcmUgdGhhdCBjb21taXQsIGEgcGFuZWwgd291bGQgYmUgbG9va2VkIHVwIHVzaW5n
IGEgcGhhbmRsZSBhbmQgYQo+IGJyaWRnZSB1c2luZyB0aGUgT0YgZ3JhcGggd2hpY2ggbWFkZSB0
aGUgRFQgYmluZGluZyBub3QgY29uc2lzdGVudC4KPgo+IEJ1dCB0aGUgcGF0Y2ggYnJva2UgdGhl
IGxhdGVyIGNhc2Ugc2luY2Ugbm90IGZpbmRpbmcgYSBwYW5lbCBkZXYgbm9kZQo+IHdvdWxkIGNh
dXNlIHRoZSBkcml2ZXIncyB0byBkbyBhIHByb2JlIGRlZmVycmFsIGluc3RlYWQgb2YgYXR0ZW1w
dGluZwo+IHRvIGxvb2t1cCBhIGJyaWRnZSBkZXZpY2Ugbm9kZSBhc3NvY2lhdGVkIHdpdGggdGhl
IHJlbW90ZSBlbmRwb2ludC4KPgo+IFNvIGluc3RlYWQgb2YgcmV0dXJuaW5nIGEgLUVQUk9CRV9E
RUZFUiBpZiBhIHBhbmVsIGlzIG5vdCBmb3VuZCwgY2hlY2sKPiBpZiB0aGVyZSdzIGEgYnJpZGdl
IGFuZCBvbmx5IGRvIGEgcHJvYmUgZGVmZXJyYWwgaWYgYm90aCBhcmVuJ3QgZm91bmQuCj4KPiBG
aXhlczogYTlmYTg1Mjg4NmZkICgiZHJtL2V4eW5vczogZHA6IGFkZCBvZl9ncmFwaCBkdCBiaW5k
aW5nIHN1cHBvcnQgZm9yIHBhbmVsIikKPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllckBvc2cuc2Ftc3VuZy5jb20+Cj4KCkFueSBjb21tZW50cyBhYm91dCB0
aGlzIHBhdGNoPyBJdCBpcyBuZWVkZWQgdG8gaGF2ZSBkaXNwbGF5IHdvcmtpbmcgb24KbWFjaGlu
ZXMgd2l0aCBhIGJyaWRnZSBjaGlwIGFnYWluIHNvIGl0IHNob3VsZCBiZSBwdXNoZWQgdG8gLXJj
IEFTQVAuCgpCZXN0IHJlZ2FyZHMsCi0tIApKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMKT3BlbiBT
b3VyY2UgR3JvdXAKU2Ftc3VuZyBSZXNlYXJjaCBBbWVyaWNhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
