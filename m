From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH 1/8] drm: exynos/dp: fix code style
Date: Thu, 6 Aug 2015 23:20:48 +0800
Message-ID: <55C37B50.6050706@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
 <1438869866-23028-1-git-send-email-ykk@rock-chips.com>
 <1438873536.2679.61.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1438873536.2679.61.camel@perches.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joe Perches <joe@perches.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, dianders@google.com, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>, Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

Sm9lLAoK5ZyoIDIwMTUvOC82IDIzOjA1LCBKb2UgUGVyY2hlcyDlhpnpgZM6Cj4gT24gVGh1LCAy
MDE1LTA4LTA2IGF0IDA5OjA0IC0wNTAwLCBZYWtpciBZYW5nIHdyb3RlOgo+PiBtYWtlIGNoZWNr
cGF0Y2gucGwgc2NyaXB0IGhhcHB5Cj4gVGhhdCBzaG91bGQgbm90IGJlIHRoZSBwcmltYXJ5IHJl
YXNvbiB0byBzdWJtaXQgYSBwYXRjaC4KPgo+IE1ha2luZyBpdCBlYXNpZXIgZm9yIGh1bWFuIGNv
ZGUgcmVhZGVyIHRvIHVuZGVyc3RhbmQKPiB3aGF0IHRoZSBjb2RlIGRvZXMgc2hvdWxkIGJlIHRo
b3VnaC4KVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBidXQgSSBkbyB0aGluayB0aGF0IGZpeCBjb2Rl
IHN0eWxlIGFuZCBtYWtlIApjaGVja3BhdGNoLnBsIHBhc3NlZCBpcyBteSBwcmltYXJ5IHJlYXNv
biB0byBzdWJtaXQgdGhpcyBwYXRjaC4gSSBjYW4ndCAKdGhpbmsgb3V0IG1vcmUgZGlyZWN0bHkg
d29yZHMgOyggLAoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RwX2NvcmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwX2NvcmUuYwo+IFtd
Cj4+IEBAIC0xMjMsMTAgKzEyMywxMSBAQCBzdGF0aWMgaW50IGV4eW5vc19kcF9yZWFkX2VkaWQo
c3RydWN0IGV4eW5vc19kcF9kZXZpY2UgKmRwKQo+PiAgIAkJZGV2X2RiZyhkcC0+ZGV2LCAiRURJ
RCBkYXRhIGluY2x1ZGVzIGEgc2luZ2xlIGV4dGVuc2lvbiFcbiIpOwo+PiAgIAo+PiAgIAkJLyog
UmVhZCBFRElEIGRhdGEgKi8KPj4gLQkJcmV0dmFsID0gZXh5bm9zX2RwX3JlYWRfYnl0ZXNfZnJv
bV9pMmMoZHAsIEkyQ19FRElEX0RFVklDRV9BRERSLAo+PiAtCQkJCQkJRURJRF9IRUFERVJfUEFU
VEVSTiwKPj4gLQkJCQkJCUVESURfQkxPQ0tfTEVOR1RILAo+PiAtCQkJCQkJJmVkaWRbRURJRF9I
RUFERVJfUEFUVEVSTl0pOwo+PiArCQlyZXR2YWwgPQo+PiArCQlleHlub3NfZHBfcmVhZF9ieXRl
c19mcm9tX2kyYyhkcCwgSTJDX0VESURfREVWSUNFX0FERFIsCj4+ICsJCQkJCSAgICAgIEVESURf
SEVBREVSX1BBVFRFUk4sCj4+ICsJCQkJCSAgICAgIEVESURfQkxPQ0tfTEVOR1RILAo+PiArCQkJ
CQkgICAgICAmZWRpZFtFRElEX0hFQURFUl9QQVRURVJOXSk7Cj4gVGhpcyBpcyBhIHJlbGF0aXZl
bHkgdW5jb21tb24gc3R5bGUuCj4KPiBCZWNhdXNlIHRoZSBjb2RlIHVzZXMgcmVsYXRpdmVseSBs
b25nIHZhcmlhYmxlIGFuZAo+IGZ1bmN0aW9uIG5hbWVzIGFzIHdlbGwgYXMgbG9uZ2lzaCBtYWNy
byAjZGVmaW5lcywKPiBwcmVmZXIgdG8gaWdub3JlIHRoZSA4MCBjb2x1bW4gbGltaXQuCk9rYXks
IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIG1vZGlmeSBsaWtlIHRob3NlOgoKcmV0dmFs
ID0gZXh5bm9zX2RwX3JlYWRfYnl0ZXNfZnJvbV9pMmMoCgkJZHAsIEkyQ19FRElEX0RFVklDRV9B
RERSLAoJCUVESURfSEVBREVSX1BBVFRFUk4sCgkJRURJRF9CTE9DS19MRU5HVEgsCgkJJmVkaWRb
RURJRF9IRUFERVJfUEFUVEVSTl0pOwoKCklzIGl0IG9rYXkgPwoKLSBZYWtpcgo+Cj4KPgo+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
