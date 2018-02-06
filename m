From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 0/4] tree-wide: fix comparison to bitshift when dealing
 with a mask
Date: Tue, 6 Feb 2018 16:59:23 +0300
Message-ID: <20180206135923.3zthazmsapuzfxra@mwanda>
References: <20180205201002.23621-1-wsa+renesas@sang-engineering.com>
 <20180206131044.oso33fvv553trrd7@mwanda>
 <alpine.DEB.2.20.1802061414340.3306@hadrien>
 <20180206132335.luut6em3kut7f7ej@mwanda>
 <alpine.DEB.2.20.1802061439110.3306@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1802061439110.3306@hadrien>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-samsung-soc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

VGhhdCBmb3VuZCA0IHRoYXQgSSB0aGluayBXb2xmcmFtJ3MgZ3JlcCBtaXNzZWQuCgogYXJjaC91
bS9kcml2ZXJzL3ZlY3Rvcl91c2VyLmggICAgICAgICAgICAgfCAgICAyIC0tCiBkcml2ZXJzL2dw
dS9kcm0vbXhzZmIvbXhzZmJfcmVncy5oICAgICAgICB8ICAgIDIgLS0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvbXhzZmIuYyAgICAgICAgICAgICAgIHwgICAgMiAtLQogaW5jbHVkZS9kcm0vZHJtX3Nj
ZGNfaGVscGVyLmggICAgICAgICAgICAgfCAgICAzIC0tLQoKQnV0IGl0IGRpZG4ndCBmaW5kIHRo
ZSB0d28gYnVncyB0aGF0IEdlZXJ0IGZvdW5kIHdoZXJlIHRoZSByaWdodCBzaWRlCndhc24ndCBh
IG51bWJlciBsaXRlcmFsLgoKZHJpdmVycy9uZXQvY2FuL21fY2FuL21fY2FuLmM6I2RlZmluZSBS
WEZDX0ZXTV9NQVNLICAgICAoMHg3ZiA8IFJYRkNfRldNX1NISUZUKQpkcml2ZXJzL3VzYi9nYWRn
ZXQvdWRjL2dva3VfdWRjLmg6I2RlZmluZSBJTlRfRVBuTkFLKG4pICgweDAwMTAwIDwgKG4pKSAg
ICAgICAgIC8qIDAgPCBuIDwgNCAqLwoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
