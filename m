From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 2/2] ARM: dts: Add rtc_src clk for s3c-rtc on
 exynos5250-snow
Date: Wed, 24 Sep 2014 01:00:47 +0900
Message-ID: <5421992F.6070908@samsung.com>
References: <1410954633-27025-1-git-send-email-javier.martinez@collabora.co.uk>
 <1410954633-27025-3-git-send-email-javier.martinez@collabora.co.uk>
 <CAD=FV=W7xJ01m2oLtuDnogOmrpwpztbir=59oSWU6oojFYUWKw@mail.gmail.com>
 <5419ADF9.3010509@suse.de> <00f801cfd6f6$07e10500$17a30f00$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <00f801cfd6f6$07e10500$17a30f00$@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Doug Anderson' <dianders@chromium.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, 'Daniel Drake' <drake@endlessm.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, =?UTF-8?B?J0FuZHJlYXMgRsOkcmJlcic=?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDkvMjMvMTQgMTU6MTcsIEt1a2ppbiBLaW0gd3JvdGU6Cj4gS3VramluIEtpbSB3cm90ZToK
Pj4+Cj4+IEFuZHJlYXMgRsOkcmJlciB3cm90ZToKPgo+IFsuLi5dCj4KPj4+PiBLdWtqaW46IEFu
ZHJlYXMncyBwYXRjaCBzZXJpZXMgd2FzIFJldmlld2VkIGxvbmcgYWdvIEkgdGhpbmsgYW5kIGJ5
Cj4+Pj4gbm93IEknZCBpbWFnaW5lIGl0J3MgZ290IHNvbWUgY29uZmxpY3RzIGR1ZSB0byBpdCBu
b3QgaGF2aW5nIGJlZW4KPj4+PiBhcHBsaWVkIGluIGEgdGltZWx5IGZhc2hpb24uICBQZXJoYXBz
IHlvdSBjb3VsZCBmaXggaXQgdXAgZm9yIEFuZHJlYXMKPj4+PiAoc2luY2UgaGUncyBhbHJlYWR5
IHJlYmFzZWQgaXQgc2V2ZXJhbCB0aW1lcykgYW5kIGxhbmQgaXQ/Cj4+Pj4KPj4+PiBJZiBJIGhh
ZCB0byBndWVzcywgb3V0c3RhbmRpbmcgZnJvbSBBbmRyZWFzJ3Mgc2VyaWVzIChwYXRjaHdvcmsg
SURzIGxpc3RlZCk6Cj4+Pj4KPj4+PiA0NzUxMTMxIE5ldyAgICAgICAgICBbdjddIEFSTTogZHRz
OiBQcmVwYXJlIG5vZGUgbGFiZWxzIGZvciBleHlub3M1MjUwCj4+Pj4gNDY2NDgwMSBOZXcgICAg
ICAgICAgW3Y2LDA0LzEwXSBBUk06IGR0czogQ2xlYW4gdXAgZXh5bm9zNTI1MC1zbm93Cj4+Pj4g
NDY2NDc3MSBOZXcgICAgICAgICAgW3Y2LDA1LzEwXSBBUk06IGR0czogRmlsbCBpbiBib290YXJn
cyBmb3IgZXh5bm9zNTI1MC1zbm93Cj4+Pj4gNDY2NDczMSBOZXcgICAgICAgICAgW3Y2LDA2LzEw
XSBBUk06IGR0czogQ2xlYW4gdXAgZXh5bm9zNTI1MC1zbWRrNTI1MAo+Pj4+IDQ2NjQ3NTEgTmV3
ICAgICAgICAgIFt2NiwwNy8xMF0gQVJNOiBkdHM6IENsZWFuIHVwIGV4eW5vczUyNTAtYXJuZGFs
ZQo+Pj4+IDQ2NjQ3MTEgTmV3ICAgICAgICAgIFt2NiwwOC8xMF0gQVJNOiBkdHM6IEZpeCBhcHBh
cmVudCBHUElPIHR5cG8gaW4KPj4+PiBleHlub3M1MjUwLWFybmRhbGUKPj4+PiA0NjY0NjgxIE5l
dyAgICAgICAgICBbdjYsMDkvMTBdIEFSTTogZHRzOiBTaW1wbGlmeSBVU0IzNTAzIG9uIGV4eW5v
czUyNTAtYXJuZGFsZQo+Pj4+IDQ2NjQ2OTEgTmV3ICAgICAgICAgIFt2NiwxMC8xMF0gQVJNOiBk
dHM6IEFkZCBleHlub3M1MjUwLXNwcmluZyBkZXZpY2UgdHJlZQo+Pj4KPj4+IFllcywgS3Vramlu
IHRvbGQgbWUgbm90IHRvIHJlc2VuZCBhbnl0aGluZywgYW5kIEkgaGF2ZW4ndCBoZWFyZCBiYWNr
Cj4+PiBmcm9tIGhpbSBzaW5jZSBoaXMgS2VybmVsIFN1bW1pdCB0cmlwLgo+Pj4KPj4gU29ycnkg
YWJvdXQgdGhhdCBhbmQgSSB0aG91Z2h0IEkgdG9vayB0aGVtIDooIEknbGwgc29ydCB0aGVtIG91
dCB0b25pZ2h0Cj4+IGluY2x1ZGluZyB0aGlzIHNlcmllcyB0b2dldGhlci4KPj4KPiBIbW0uLi5z
aW5jZSBzb21lIGNvbmZsaWN0cyB3aXRoIGRwIGFuZCBtbWNfc2xvdCByZWxhdGVkIHBhdGNoZXMs
IEkgY291bGRuJ3QsCj4gYnV0IEFuZHJlYXMnIHBhdGNoZXMgd2lsbCBiZSBoYW5kbGVkIGJ5IHRv
bmlnaHQgOigKPgo+IC0gS3VramluCgpJJ3ZlIGFwcGxpZWQgYWJvdmUgYW5kIHRoaXMgc2VyaWVz
IGFuZCBwbGVhc2UgZG91YmxlLWNoZWNrIHRoZSBjb21taXRzIAppbiBteSB0cmVlLiBJZiBubyBw
cm9ibGVtcywgSSB3aWxsIHNlbmQgdGhlIGJyYW5jaCBvdXQgZm9yIHYzLjE4IHNvb24uLi4KClRo
YW5rcywKS3VramluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hcm0ta2VybmVsCg==
