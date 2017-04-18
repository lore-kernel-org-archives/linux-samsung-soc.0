From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add support for s6e3hf2 panel
 device on TM2e board
Date: Tue, 18 Apr 2017 09:56:28 +0200
Message-ID: <94152d85-5fb0-f5dc-045d-e6ee6c009f42@samsung.com>
References: <1492408934-22096-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170417060220epcas5p42f6ed43d9db94779382e84a129b9da2d@epcas5p4.samsung.com>
 <1492408934-22096-4-git-send-email-hoegeun.kwon@samsung.com>
 <b9bfcdd9-5576-34c3-6c7d-556b6c81946d@samsung.com>
 <f2acb724-ba41-175c-061a-7be765cc1939@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <f2acb724-ba41-175c-061a-7be765cc1939@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>, thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTguMDQuMjAxNyAwOTo0NCwgSG9lZ2V1biBLd29uIHdyb3RlOgo+IE9uIDA0LzE4LzIwMTcg
MDM6MDAgUE0sIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4+IE9uIDE3LjA0LjIwMTcgMDg6MDIsIEhv
ZWdldW4gS3dvbiB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggYWRkIHRoZSBwYW5lbCBkZXZpY2UgdHJl
ZSBub2RlIGZvciBzNmUzaGYyIGRpc3BsYXkKPj4+IGNvbnRyb2xsZXIgdG8gVE0yZSBkdHMuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSG9lZ2V1biBLd29uIDxob2VnZXVuLmt3b25Ac2Ftc3VuZy5j
b20+Cj4+IE1heWJlIGl0IHdvdWxkIGJlIGdvb2QgdG8gcmVtb3ZlIHRlLWdwaW9zIHByb3BlcnR5
IC0gdG0yL3RtMmUgdXNlcwo+PiBoYXJkd2FyZSB0cmlnZ2VyLCBzbyBpdCBpcyBub3QgbmVjZXNz
YXJ5IGFuZCBnZW5lcmF0ZXMgdXNlbGVzcyBpbnRlcnJ1cHRzLgo+IFRoYW5rcyBmb3IgeW91ciBy
ZXZpZXcuCj4KPiBJIGFncmVlLCBidXQgSSB0aGlua3MgcmVtb3ZlIHRoZSB0ZS1ncGlvIHByb3Bl
cnR5IGFmdGVyIHlvdXIgcGF0Y2ggWzFdIAo+IGhhcyBiZWVuIG1lcmdlZC4KClBhdGNoIFsxXSBo
YXMgYmVlbiBtZXJnZWQgYWJvdXQgbW9udGggYWdvIDopCgpSZWdhcmRzCkFuZHJ6ZWoKCj4KPgo+
IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzk2MjUzODMvCj4KPiBCZXN0
IHJlZ2FyZHMsCj4gSG9lZ2V1bgo+Cj4+IEJlc2lkZSB0aGlzOgo+PiBSZXZpZXdlZC1ieTogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPj4gICAtLQo+PiBSZWdhcmRzCj4+IEFu
ZHJ6ZWoKPj4+IC0tLQo+Pj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMz
LXRtMmUuZHRzIHwgMTIgKysrKysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9z
L2V4eW5vczU0MzMtdG0yZS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1
NDMzLXRtMmUuZHRzCj4+PiBpbmRleCA2OTQ3MTdhLi45OGFkMDk0IDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTJlLmR0cwo+Pj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZXh5bm9zNTQzMy10bTJlLmR0cwo+Pj4gQEAgLTUy
LDYgKzUyLDE4IEBACj4+PiAgIAlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyNzgwMDAwMDA+LCA8
NDAwMDAwMDAwPjsKPj4+ICAgfTsKPj4+ICAgCj4+PiArJmRzaSB7Cj4+PiArCXBhbmVsQDAgewo+
Pj4gKwkJY29tcGF0aWJsZSA9ICJzYW1zdW5nLHM2ZTNoZjIiOwo+Pj4gKwkJcmVnID0gPDA+Owo+
Pj4gKwkJdmRkMy1zdXBwbHkgPSA8JmxkbzI3X3JlZz47Cj4+PiArCQl2Y2ktc3VwcGx5ID0gPCZs
ZG8yOF9yZWc+Owo+Pj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwZzAgMCBHUElPX0FDVElWRV9MT1c+
Owo+Pj4gKwkJZW5hYmxlLWdwaW9zID0gPCZncGYxIDUgR1BJT19BQ1RJVkVfSElHSD47Cj4+PiAr
CQl0ZS1ncGlvcyA9IDwmZ3BmMSAzIEdQSU9fQUNUSVZFX0hJR0g+Owo+Pj4gKwl9Owo+Pj4gK307
Cj4+PiArCj4+PiAgICZsZG8zMV9yZWcgewo+Pj4gICAJcmVndWxhdG9yLW5hbWUgPSAiVFNQX1ZE
RF8xLjhWX0FQIjsKPj4+ICAgCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Owo+
Pgo+Pgo+IC0tCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUg
InVuc3Vic2NyaWJlIGxpbnV4LXNhbXN1bmctc29jIiBpbgo+IHRoZSBib2R5IG9mIGEgbWVzc2Fn
ZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCj4gTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAg
aHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCj4KPgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
