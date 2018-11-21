From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: odroid hc2?
Date: Wed, 21 Nov 2018 10:59:41 +0100
Message-ID: <f7d9845c-6970-ac5b-6c24-f5c6298425f7@samsung.com>
References: <CGME20181121091230epcas2p4b08f553cc2e160980a26b1c8a47c5cbc@epcas2p4.samsung.com>
 <d2fc632f-e0bb-6d0a-35f6-64fcb16c354e@mbox200.swipnet.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d2fc632f-e0bb-6d0a-35f6-64fcb16c354e@mbox200.swipnet.se>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Torbjorn Jansson <torbjorn.jansson@mbox200.swipnet.se>, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Torbjorn,

On 2018-11-21 10:06, Torbjorn Jansson wrote:
> Hello.
>
> a question for the experts and a small wish/request.
> is it possible to get the odroid hc2 up to same level of support in
> the kernel as hc1?
> my understanding is that they are basically the same thing but hc1
> uses a 2.5 inch disk and hc2 uses 3.5 inch discs.
>
> there is two parts to this i believe.
> i'm using fedora 29 to test this and the first part is that uboot (i
> think) doesn't recognize the hc2 properly so it tries to load the dtb
> file exynos5422-odroidunknown.dtb
> i can work around this by creating a symlink from
> exynos5422-odroidhc1.dtb and get it to boot.
>
> second part is ofcourse that there is no dtb file for hc2 so even if
> uboot did pickup the right file it wound not exist.
>
> using the hc1 dtb file with my hc2 appears to work fine.

>From Linux kernel perspective Odroid HC2 doesn't differ from HC1, so it
simply should use HC1 dtb. Recently there have been u-boot patch for
adding HC2 detection, which also fixes 'unknown' dtb issue on HC2:
https://lists.denx.de/pipermail/u-boot/2018-October/345365.html

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
