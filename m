From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/3] drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=n as GSC Kconfig
 dependency
Date: Mon, 28 Mar 2016 21:28:56 -0400
Message-ID: <1459214937-18686-3-git-send-email-javier@osg.samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Q29tbWl0IGFlZWZiMzY4MzJlNSAoImRybS9leHlub3M6IGdzYzogYWRkIGRldmljZSB0cmVlIHN1
cHBvcnQgYW5kIHJlbW92ZQp1c2FnZSBvZiBzdGF0aWMgbWFwcGluZ3MiKSBtYWRlIHRoZSBEUk1f
RVhZTk9TX0dTQyBLY29uZmlnIHN5bWJvbCB0byBvbmx5CmJlIHNlbGVjdGFibGUgaWYgdGhlIGV4
eW5vcy1nc2MgVjRMMiBkcml2ZXIgaXNuJ3QgZW5hYmxlZCwgc2luY2UgYm90aCB1c2UKdGhlIHNh
bWUgSFcgSVAgYmxvY2suCgpCdXQgYWRkZWQgdGhlIGRlcGVuZGVuY3kgYXMgZGVwZW5kcyBvbiAh
VklERU9fU0FNU1VOR19FWFlOT1NfR1NDIHdoaWNoIGlzCm5vdCBjb3JyZWN0IHNpbmNlIEtjb25m
aWcgZXhwcmVzc2lvbnMgYXJlIG5vdCBib29sZWFuIGJ1dCB0cmlzdGF0ZS4gU28gaXQKd2lsbCBv
bmx5IGV2YWx1YXRlIHRvICduJyBpZiBWSURFT19TQU1TVU5HX0VYWU5PU19HU0M9eSBidXQgd2ls
bCBldmFsdWF0ZQp0byAnbScgaWYgVklERU9fU0FNU1VOR19TNVBfRzJEPW0uCgpUaGlzIG1lYW5z
IHRoYXQgYm90aCB0aGUgVjRMMiBhbmQgRFJNIGRyaXZlcnMgY2FuIGJlIGVuYWJsZWQgaWYgdGhl
IGZvcm1lcgppcyBlbmFibGVkIGFzIGEgbW9kdWxlLCB3aGljaCBpcyBub3Qgd2hhdCB3ZSB3YW50
LgoKU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJAb3NnLnNh
bXN1bmcuY29tPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L0tjb25maWcKaW5kZXggYmFkZGYzM2ZiNDc1Li44YzI3MDM3Nzg3ZmMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L0tjb25maWcKQEAgLTExOCw3ICsxMTgsNyBAQCBjb25maWcgRFJNX0VYWU5PU19ST1RBVE9SCiAK
IGNvbmZpZyBEUk1fRVhZTk9TX0dTQwogCWJvb2wgIkdTY2FsZXIiCi0JZGVwZW5kcyBvbiBEUk1f
RVhZTk9TX0lQUCAmJiBBUkNIX0VYWU5PUzUgJiYgIVZJREVPX1NBTVNVTkdfRVhZTk9TX0dTQwor
CWRlcGVuZHMgb24gRFJNX0VYWU5PU19JUFAgJiYgQVJDSF9FWFlOT1M1ICYmIFZJREVPX1NBTVNV
TkdfRVhZTk9TX0dTQz1uCiAJaGVscAogCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3YW50
IHRvIHVzZSBFeHlub3MgR1NDIGZvciBEUk0uCiAKLS0gCjIuNS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
