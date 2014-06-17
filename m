From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 07/10] regulator: Add driver for Maxim 77802 PMIC
 regulators
Date: Tue, 17 Jun 2014 22:17:47 +0100
Message-ID: <20140617211747.GY29841@lee--X1>
References: <1402941758-11216-1-git-send-email-javier.martinez@collabora.co.uk>
 <1402941758-11216-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1402941758-11216-8-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Daniel Stone <daniels@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

PiBUaGUgTUFYNzc4MDIgUE1JQyBoYXMgMTAgaGlnaC1lZmZpY2llbmN5IEJ1Y2sgYW5kIDMyIExv
dy1kcm9wb3V0Cj4gKExETykgcmVndWxhdG9ycy4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9y
IGFsbCB0aGVzZSByZWd1bGF0b3JzCj4gZm91bmQgb24gdGhlIE1BWDc3ODAyIFBNSUMgYW5kIGlz
IGJhc2VkIG9uIGEgZHJpdmVyIGFkZGVkIGJ5IFNpbW9uCj4gR2xhc3MgdG8gdGhlIENocm9tZSBP
UyBrZXJuZWwgMy44IHRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENh
bmlsbGFzIDxqYXZpZXIubWFydGluZXpAY29sbGFib3JhLmNvLnVrPgo+IC0tLQo+IAo+IENoYW5n
ZXMgc2luY2UgdjE6Cj4gIC0gUmVtb3ZlIHVubmVlZGVkIGNoZWNrIGlmIG51bV9yZWd1bGF0b3Jz
ICE9IE1BWDc3ODAyX01BWF9SRUdVTEFUT1JTLgo+ICAtIEZpeCAuc2V0X3N1c3BlbmRfbW9kZSBo
YW5kbGVyIGNvbW1lbnQgYW5kIHNwbGl0IHJlZ3VsYXRvcnMgb3BzIGZvcgo+ICAgIHJlZ3VsYXRv
cnMgdGhhdCBiZWhhdmUgZGlmZmVyZW50bHkuIFN1Z2dlc3RlZCBieSBNYXJrIEJyb3duLgo+ICAt
IFVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgaW5zdGVhZCBvZiBoYXZpbmcgaW5pdC9leGl0
IGZ1bmN0aW9ucy4KPiAgICBTdWdnZXN0ZWQgYnkgTWFyayBCcm93bi4KPiAgLSBVc2UgdGhlIG5l
dyBkZXNjcmlwdG9yLWJhc2VkIEdQSU8gaW50ZXJmYWNlIGluc3RlYWQgb2YgdGhlIGRlcHJlY2F0
ZWQKPiAgICBpbnRlZ2VyIGJhc2VkIEdQSU8gb25lLiBTdWdnZXN0ZWQgYnkgTWFyayBCcm93bi4K
PiAgLSBMb29rIGZvciAicmVndWxhdG9ycyIgY2hpbGQgbm9kZSBpbnN0ZWFkIG9mICJ2b2x0YWdl
LXJlZ3VsYXRvcnMiIHRvIGJlCj4gICAgY29uc2lzdGVudCB3aXRoIG90aGVyIFBNSUMgZHJpdmVy
cy4gU3VnZ2VzdGVkIGJ5IE1hcmsgQnJvd24uCj4gCj4gIGRyaXZlcnMvbWZkL21heDc3ODAyLmMg
ICAgICAgfCAgIDEgKwoKQ2FuIHlvdSByZW1vdmUgYWxsIG9mIHRoZSBNRkQgY2hhbmdlcyBmcm9t
IHBhdGNoZXMgNywgOCBhbmQgOSBhbmQKY3JlYXRlIG5ldyBvbmUuICBUaGF0IHdheSB0aGVyZSdz
IG5vIHJlcXVpcmVtZW50IGZvciBhbnkgY3Jvc3MKc3Vic3lzdGVtIG1lc3NpbmVzcy4KCj4gIGRy
aXZlcnMvcmVndWxhdG9yL0tjb25maWcgICAgfCAgIDkgKwo+ICBkcml2ZXJzL3JlZ3VsYXRvci9N
YWtlZmlsZSAgIHwgICAxICsKPiAgZHJpdmVycy9yZWd1bGF0b3IvbWF4Nzc4MDIuYyB8IDcwMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNzEyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVn
dWxhdG9yL21heDc3ODAyLmMKCi0tIApMZWUgSm9uZXMKTGluYXJvIFNUTWljcm9lbGVjdHJvbmlj
cyBMYW5kaW5nIFRlYW0gTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
