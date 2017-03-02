From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v6 2/2] [media] s5p-mfc: Handle 'v4l2_pix_format:field' in
 try_fmt and g_fmt
Date: Thu, 02 Mar 2017 08:42:51 +0100
Message-ID: <54862f6b-290d-7e87-4297-57ffc35d357a@samsung.com>
References: <20170301115108.14187-1-thibault.saunier@osg.samsung.com>
 <CGME20170301115141epcas2p37801b1fbe0951cc37a4e01bf2bcae3da@epcas2p3.samsung.com>
 <20170301115108.14187-3-thibault.saunier@osg.samsung.com>
 <33dbd3fa-04b2-3d94-5163-0a10589ff1c7@samsung.com>
 <1488381666.14858.5.camel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1488381666.14858.5.camel@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Inki Dae <inki.dae@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, Jeongtae Park <jtp.park@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Kamil Debski <kamil@wypas.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDEuMDMuMjAxNyAxNjoyMSwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToKPiBMZSBtZXJjcmVk
aSAwMSBtYXJzIDIwMTcgw6AgMTQ6MTIgKzAxMDAsIEFuZHJ6ZWogSGFqZGEgYSDDqWNyaXQgOgo+
PiAtIG9uIG91dHB1dCBzaWRlIHlvdSBoYXZlIGVuY29kZWQgYnl0ZXN0cmVhbSAtIHlvdSBjYW5u
b3Qgc2F5IGFib3V0Cj4+IGludGVybGFjaW5nIGluIHN1Y2ggY2FzZSwgc28gdGhlIG9ubHkgdmFs
aWQgdmFsdWUgaXMgTk9ORSwKPj4gLSBvbiBjYXB0dXJlIHNpZGUgeW91IGhhdmUgZGVjb2RlZCBm
cmFtZXMsIGFuZCBpbiB0aGlzIGNhc2UgaXQKPj4gZGVwZW5kcwo+PiBvbiB0aGUgZGV2aWNlIGFu
ZCBkcml2ZXIgY2FwYWJpbGl0aWVzLCBpZiB0aGUgZHJpdmVyL2RldmljZSBkb2VzIG5vdAo+PiBz
dXBwb3J0IChkZS0paW50ZXJsYWNpbmcgKEkgc3VwcG9zZSB0aGlzIGlzIE1GQyBjYXNlKSwgaW50
ZXJsYWNlIHR5cGUKPj4gZmllbGQgc2hvdWxkIGJlIGZpbGxlZCBhY2NvcmRpbmcgdG8gZGVjb2Rl
ZCBieXRlc3RyZWFtIGhlYWRlciAob24KPj4gb3V0cHV0Cj4+IHNpZGUpLCBidXQgbm8gZGlyZWN0
IGNvcHlpbmcgZnJvbSBvdXRwdXQgc2lkZSEhIQo+IEkgdGhpbmsgd2UgbmVlZCBzb21lIG51YW5j
ZSBoZXJlIGZvciB0aGlzIHRvIGFjdHVhbGx5IGJlIHVzYWJsZS4gSWYgdGhlCj4gaW5mb3JtYXRp
b24gaXMgbm90IHByb3ZpZGVkIGJ5IHRoZSBkcml2ZXIgKHllcywgaGFyZHdhcmUgaXMgbGltaXRp
bmcKPiBzb21ldGltZXMpLCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGNvcHkgb3ZlciB0aGUgaW5m
b3JtYXRpb24gdGhhdAo+IHVzZXJzcGFjZSBwcm92aWRlZC4gU2V0dGluZyBOT05FIGlzIGp1c3Qg
dGhlIHdvcnN0IGFwcHJveGltYXRpb24gaW4gbXkKPiBvcGluaW9uLgoKVGhlIHdob2xlIHBvaW50
IGlzIHRoYXQgc19mbXQgb24gb3V0cHV0IHNpZGUgaXMgdG8gZGVzY3JpYmUgZm9ybWF0IG9mCnRo
ZSBzdHJlYW0gcGFzc2VkIHRvIHRoZSBkZXZpY2UsIGFuZCBpbiBjYXNlIG9mIGRlY29kZXIgaXQg
aXMganVzdAptcGVnL2guMjZ4Ly4uLiBzdHJlYW0uIEl0IGRvZXMgbm90IGNvbnRhaW4gZnJhbWVz
LCBmaWVsZHMsIHdpZHRoLCBoZWlnaHQKLSBpdCBpcyBqdXN0IHJhdyBzdHJlYW0gb2YgYnl0ZXMu
IFdlIGNhbm5vdCBzYXkgaW4gc3VjaCBjYXNlIGFib3V0IGZpZWxkCnR5cGUsIHRoZXJlIGlzIG5v
dCBzdWNoIHRoaW5nIGFzIGludGVybGFjZWQgYnl0ZSBzdHJlYW0uClVzaW5nIHNfZm10IG9uIG91
dHB1dCB0byBkZXNjcmliZSB0aGluZ3Mgb24gY2FwdHVyZSBzaWRlIGxvb2sgZm9yIG1lCnVubmVj
ZXNzYXJ5IGFuZCBhYnVzZXMgVjRMMiBBUEkgSU1PLgoKPgo+IEFib3V0IE1GQywgaXQgd2lsbCBi
ZSB3b3J0aCB0cnlpbmcgdG8gcmVhZCB0aGUgRElTUExBWV9TVEFUVVMgYWZ0ZXIgdGhlCj4gaGVh
ZGVycyBoYXMgYmVlbiBwcm9jZXNzZWQuIEl0J3Mgbm90IGNsZWFybHkgc3RhdGVkIGluIHRoZSBz
cGVjIGlmIHRoaXMKPiB3aWxsIGJlIHNldCBvciBub3QuCj4KRG9jdW1lbnRhdGlvbiBmb3IgTUZD
Ni41IHN0YXRlcyBjbGVhcmx5OgoKPiBOb3RlOiBPbiBTRVFfRE9ORSwgSU5URVJMQUNFX1BJQ1RV
UkUgd2lsbCByZXR1cm4gdGhlIHBpY3R1cmUgdHlwZSB0bwo+IGJlIGRlY29kZWQgYmFzZWQgb24g
dGhlCj4gc2VxdWVuY2UgaGVhZGVyIGluZm9ybWF0aW9uLgoKSW4gY2FzZSBvZiBNRkM1LjEgaXQg
aXMgdW5jbGVhciwgYnV0IEkgaG9wZSBIVyBiZWhhdmVzIHRoZSBzYW1lIHdheS4KCkFueXdheSBJ
IGFncmVlIGl0IHdpbGwgYmUgZ29vZCB0byBmaXggaXQgYXQgbGVhc3QgZm9yIE1GQzYuNSssIGFu
eQp2b2x1bnRlZXI/CgoKUmVnYXJkcwoKQW5kcnplagoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cmxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
