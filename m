From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 2/2] ARM: exynos: Enable support for ARM architected
 timers
Date: Fri, 6 Sep 2019 10:10:42 +0900
Message-ID: <ee7945aa-d668-6017-8aec-7f377f3951fb@samsung.com>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2@eucas1p2.samsung.com>
 <20190828121005.29368-3-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828121005.29368-3-m.szyprowski@samsung.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RGVhciBNYXJlaywKCk9uIDE5LiA4LiAyOC4g7Jik7ZuEIDk6MTAsIE1hcmVrIFN6eXByb3dza2kg
d3JvdGU6Cj4gQVJNIGFyY2hpdGVjdGVkIHRpbWVyIGNhbiBiZSB1c2VkIHRvZ2V0aGVyIHdpdGgg
RXh5bm9zIE11bHRpQ29yZSBUaW1lcgo+IGRyaXZlciwgc28gZW5hYmxlIHN1cHBvcnQgZm9yIGl0
LiBTdXBwb3J0IGZvciBBUk0gYXJjaGl0ZWN0ZWQgdGltZXJzIGlzCj4gZXNzZW50aWFsIGZvciBl
bmFibGluZyBwcm9wZXIgS1ZNIHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5
cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL2FybS9tYWNo
LWV4eW5vcy9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWV4eW5vcy9LY29uZmlnIGIvYXJjaC9hcm0v
bWFjaC1leHlub3MvS2NvbmZpZwo+IGluZGV4IGY4Mzc4NjY0MGY5NC4uOWRhYjFmNTBhMDJmIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtZXh5bm9zL0tjb25maWcKPiArKysgYi9hcmNoL2Fy
bS9tYWNoLWV4eW5vcy9LY29uZmlnCj4gQEAgLTE5LDYgKzE5LDcgQEAgbWVudWNvbmZpZyBBUkNI
X0VYWU5PUwo+ICAJc2VsZWN0IEVYWU5PU19TUk9NCj4gIAlzZWxlY3QgRVhZTk9TX1BNX0RPTUFJ
TlMgaWYgUE1fR0VORVJJQ19ET01BSU5TCj4gIAlzZWxlY3QgR1BJT0xJQgo+ICsJc2VsZWN0IEhB
VkVfQVJNX0FSQ0hfVElNRVIgaWYgQVJDSF9FWFlOT1M1ICYmIFZJUlRVQUxJWkFUSU9OCj4gIAlz
ZWxlY3QgSEFWRV9BUk1fU0NVIGlmIFNNUAo+ICAJc2VsZWN0IEhBVkVfUzNDMjQxMF9JMkMgaWYg
STJDCj4gIAlzZWxlY3QgSEFWRV9TM0MyNDEwX1dBVENIRE9HIGlmIFdBVENIRE9HCj4gCgpSZXZp
ZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+CgotLSAKQmVzdCBS
ZWdhcmRzLApDaGFud29vIENob2kKU2Ftc3VuZyBFbGVjdHJvbmljcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
