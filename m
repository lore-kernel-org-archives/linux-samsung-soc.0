From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] exynos-drm: Fix unsupported GEM memory type error
 message to be clear
Date: Wed, 10 Aug 2016 13:37:53 -0400
Message-ID: <a111b98f-0596-79bf-77e2-be9a95875369@osg.samsung.com>
References: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gU2h1YWgsCgpPbiAwOC8wOC8yMDE2IDA3OjQ4IFBNLCBTaHVhaCBLaGFuIHdyb3RlOgo+
IEZpeCB1bnN1cHBvcnRlZCBHRU0gbWVtb3J5IHR5cGUgZXJyb3IgbWVzc2FnZSB0byBpbmNsdWRl
IHRoZSBtZW1vcnkgdHlwZQo+IGluZm9ybWF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNodWFo
IEtoYW4gPHNodWFoa2hAb3NnLnNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gLS0gQ29tbWVudCBjaGFuZ2VkIHRvIHJlYWQgY2xlYXJseQo+IAo+ICBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZmIuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2ZiLmMKPiBpbmRleCBlMDE2NjQwLi40MGNlODQxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiLmMKPiBAQCAtNTUsMTEgKzU1LDExIEBAIHN0YXRpYyBp
bnQgY2hlY2tfZmJfZ2VtX21lbW9yeV90eXBlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+
ICAJZmxhZ3MgPSBleHlub3NfZ2VtLT5mbGFnczsKPiAgCj4gIAkvKgo+IC0JICogd2l0aG91dCBp
b21tdSBzdXBwb3J0LCBub3Qgc3VwcG9ydCBwaHlzaWNhbGx5IG5vbi1jb250aW51b3VzIG1lbW9y
eQo+IC0JICogZm9yIGZyYW1lYnVmZmVyLgo+ICsJICogUGh5c2ljYWxseSBub24tY29udGlndW91
cyBtZW1vcnkgdHlwZSBmb3IgZnJhbWVidWZmZXIgaXMgbm90Cj4gKwkgKiBzdXBwb3J0ZWQgd2l0
aG91dCBJT01NVS4KPiAgCSAqLwo+ICAJaWYgKElTX05PTkNPTlRJR19CVUZGRVIoZmxhZ3MpKSB7
Cj4gLQkJRFJNX0VSUk9SKCJjYW5ub3QgdXNlIHRoaXMgZ2VtIG1lbW9yeSB0eXBlIGZvciBmYi5c
biIpOwo+ICsJCURSTV9FUlJPUigiTm9uLWNvbnRpZ3VvdXMgR0VNIG1lbW9yeSBpcyBub3Qgc3Vw
cG9ydGVkLlxuIik7Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAo+IAoKUGF0Y2ggbG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllckBvc2cuc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0tIApKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMKT3BlbiBTb3VyY2UgR3JvdXAKU2Ftc3VuZyBSZXNlYXJjaCBBbWVyaWNhCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
