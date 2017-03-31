From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv6 08/10] stih-cec.txt: document new hdmi phandle
Date: Fri, 31 Mar 2017 14:20:34 +0200
Message-ID: <20170331122036.55706-9-hverkuil@xs4all.nl>
References: <20170331122036.55706-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170331122036.55706-1-hverkuil@xs4all.nl>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Patrice.chotard@st.com, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CgpV
cGRhdGUgdGhlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gd2l0aCB0aGUgbmV3IGhkbWkgcGhhbmRs
ZS4KClNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBs
aW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNj
by5jb20+CkFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDQzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvc3RpaC1jZWMudHh0IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9zdGloLWNlYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
c3RpaC1jZWMudHh0CmluZGV4IDcxYzRiMmY0YmNlZi4uMjg5YTA4YjMzNjUxIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3RpaC1jZWMudHh0Cisr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdGloLWNlYy50eHQK
QEAgLTksNiArOSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAgLSBwaW5jdHJsLW5hbWVzOiBD
b250YWlucyBvbmx5IG9uZSB2YWx1ZSAtICJkZWZhdWx0IgogIC0gcGluY3RybC0wOiBTcGVjaWZp
ZXMgdGhlIHBpbiBjb250cm9sIGdyb3VwcyB1c2VkIGZvciBDRUMgaGFyZHdhcmUuCiAgLSByZXNl
dHM6IFJlZmVyZW5jZSB0byBhIHJlc2V0IGNvbnRyb2xsZXIKKyAtIGhkbWktcGhhbmRsZTogUGhh
bmRsZSB0byB0aGUgSERNSSBjb250cm9sbGVyCiAKIEV4YW1wbGUgZm9yIFNUSUg0MDc6CiAKQEAg
LTIyLDQgKzIzLDUgQEAgc3RpLWNlY0AwOTRhMDg3YyB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKIAlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfY2VjMF9kZWZhdWx0PjsKIAlyZXNldHMgPSA8
JnNvZnRyZXNldCBTVElINDA3X0xQTV9TT0ZUUkVTRVQ+OworCWhkbWktcGhhbmRsZSA9IDwmaGRt
aT47CiB9OwotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
