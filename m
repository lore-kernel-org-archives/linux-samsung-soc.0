From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv5 06/11] s5p-cec.txt: document the HDMI controller phandle
Date: Wed, 29 Mar 2017 16:15:38 +0200
Message-ID: <20170329141543.32935-7-hverkuil@xs4all.nl>
References: <20170329141543.32935-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170329141543.32935-1-hverkuil@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

RnJvbTogSGFucyBWZXJrdWlsIDxoYW5zLnZlcmt1aWxAY2lzY28uY29tPgoKVXBkYXRlIHRoZSBi
aW5kaW5ncyBkb2N1bWVudGluZyB0aGUgbmV3IGhkbWkgcGhhbmRsZS4KClNpZ25lZC1vZmYtYnk6
IEhhbnMgVmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT4KQ0M6IGxpbnV4LXNhbXN1bmct
c29jQHZnZXIua2VybmVsLm9yZwpDQzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKQ0M6IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvczVwLWNlYy50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL3M1cC1jZWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL3M1cC1jZWMudHh0CmluZGV4IDkyNWFiNGQ3MmVhYS4uNGJiMDhkOWQ5NDBi
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvczVw
LWNlYy50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3M1
cC1jZWMudHh0CkBAIC0xNSw2ICsxNSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAgIC0gY2xv
Y2stbmFtZXMgOiBmcm9tIGNvbW1vbiBjbG9jayBiaW5kaW5nOiBtdXN0IGNvbnRhaW4gImhkbWlj
ZWMiLAogCQkgIGNvcnJlc3BvbmRpbmcgdG8gZW50cnkgaW4gdGhlIGNsb2NrcyBwcm9wZXJ0eS4K
ICAgLSBzYW1zdW5nLHN5c2Nvbi1waGFuZGxlIC0gcGhhbmRsZSB0byB0aGUgUE1VIHN5c3RlbSBj
b250cm9sbGVyCisgIC0gaGRtaS1waGFuZGxlIC0gcGhhbmRsZSB0byB0aGUgSERNSSBjb250cm9s
bGVyCiAKIEV4YW1wbGU6CiAKQEAgLTI1LDYgKzI2LDcgQEAgaGRtaWNlYzogY2VjQDEwMEIwMDAw
IHsKIAljbG9ja3MgPSA8JmNsb2NrIENMS19IRE1JX0NFQz47CiAJY2xvY2stbmFtZXMgPSAiaGRt
aWNlYyI7CiAJc2Ftc3VuZyxzeXNjb24tcGhhbmRsZSA9IDwmcG11X3N5c3RlbV9jb250cm9sbGVy
PjsKKwloZG1pLXBoYW5kbGUgPSA8JmhkbWk+OwogCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
CiAJcGluY3RybC0wID0gPCZoZG1pX2NlYz47CiAJc3RhdHVzID0gIm9rYXkiOwotLSAKMi4xMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
