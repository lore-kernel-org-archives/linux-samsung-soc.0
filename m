From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v10 0/17] Add Analogix Core Display Port Driver
Date: Wed, 16 Dec 2015 08:50:10 +0800
Message-ID: <5670B542.4060402@rock-chips.com>
References: <1449470239-30667-1-git-send-email-ykk@rock-chips.com>
 <4659407.pYb0RRCQQX@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4659407.pYb0RRCQQX@diego>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSGVpa28sCgpPbiAxMi8xNS8yMDE1IDA4OjA2IEFNLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToK
PiBIaSBZYWtpciwKPgo+IEFtIE1vbnRhZywgNy4gRGV6ZW1iZXIgMjAxNSwgMTQ6Mzc6MTkgc2No
cmllYiBZYWtpciBZYW5nOgo+PiAgICAgVGhlIFNhbXN1bmcgRXh5bm9zIGVEUCBjb250cm9sbGVy
IGFuZCBSb2NrY2hpcCBSSzMyODggZURQIGNvbnRyb2xsZXIKPj4gc2hhcmUgdGhlIHNhbWUgSVAs
IHNvIGEgbG90IG9mIHBhcnRzIGNhbiBiZSByZS11c2VkLiBJIHNwbGl0IHRoZSBjb21tb24KPj4g
Y29kZSBpbnRvIGJyaWRnZSBkaXJlY3RvcnksIHRoZW4gcmszMjg4IGFuZCBleHlub3Mgb25seSBu
ZWVkIHRvIGtlZXAKPj4gc29tZSBwbGF0Zm9ybSBjb2RlLiBDYXVzZSBJIGNhbid0IGZpbmQgdGhl
IGV4YWN0IElQIG5hbWUgb2YgZXh5bm9zIGRwCj4+IGNvbnRyb2xsZXIsIHNvIEkgZGVjaWRlIHRv
IG5hbWUgZHAgY29yZSBkcml2ZXIgd2l0aCAiYW5hbG9naXgiIHdoaWNoIEkKPj4gZmluZCBpbiBy
azMyODggZURQIFRSTQo+IHNvIGl0IGxvb2tzIGxpa2UgdGhlIGhvdHBsdWcgd29ya3MgbmljZWx5
IG5vdy4gSSB3YXMgYWJsZSB0byB0ZXN0IGl0Cj4gc3VjZXNzZnVsbHkgb24gYm90aCBhIEplcnJ5
IGFuZCBhIE1pbm5pZSBkZXZpY2Ugd2l0aG91dCBuZWVkaW5nIHRvIGZvcmNlCj4gaG90cGx1ZyA6
LSkgLgo+Cj4gQXMgSSBuZWVkZWQgdG8gYWRhcHQgc29tZSBwYXRjaGVzIHdoZW4gYXBwbHlpbmcg
dGhlIGxhc3Rlc3Qgb25lcywgSSB0aGluayBpdAo+IHdvdWxkIGJlIGdvb2QgZm9yIGEgZnVsbCBz
ZW5kIG9mIHRoZSBsYXRlc3QgdmVyc2lvbiBhcyB2MTEuCgpHb3QgaXQsIHdpbGwgc2VuZCBzb29u
ICA7KQoKPiBXaGVuIGdvaW5nIG92ZXIgdGhlIHBhdGNoZXMgYmVmb3JlIHNlbmRpbmcsIHBsZWFz
ZSBhbHNvIGZpeCB0aGUgaW5kZW50YXRpb24KPiBpc3N1ZXMgaW4gYW5hbG9naXhfZHBfY29yZS5o
IC0gYm90aCBuZXdseSBhZGRlZCBlbGVtZW50cyB0byBhbmFsb2dpeF9kcF9kZXZpY2UKPiB1c2Ug
c3BhY2VzIGJldHdlZW4gdHlwZSBhbmQgbmFtZSwgd2hlcmUgdGhlIHJlc3QgdXNlcyB0YWJzLgo+
IFtUaGlzIHNob3VsZCBvZiBjb3Vyc2UgYmUgZml4ZWQgaW4gdGhlIHBhdGNoZXMgYWRkaW5nIHRo
ZXNlIGxpbmVzIDotKSBdCgpEb25lLAoKVGhhbmtzLAotIFlha2lyCgo+Cj4gSGVpa28KPgo+Cj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
