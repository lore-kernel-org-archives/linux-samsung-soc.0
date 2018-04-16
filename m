From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] ARM: exynos_defconfig: enable S6E63J0X03 panel driver
Date: Mon, 16 Apr 2018 14:10:56 +0200
Message-ID: <CAJKOXPfH2tx7TVPPJcmyP+mkgNy50=NfuU-fBYQ8F3ZOoma8xw@mail.gmail.com>
References: <CGME20180416103544eucas1p232a511004fcda0ee20c94153caa1bff7@eucas1p2.samsung.com>
 <20180416103537.29518-1-m.szyprowski@samsung.com>
 <20180416103537.29518-2-m.szyprowski@samsung.com>
 <CAJKOXPek-AEk39QNN9iw2AK9qPJdE1HWe+-6ocQGT1WTWUvjig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPek-AEk39QNN9iw2AK9qPJdE1HWe+-6ocQGT1WTWUvjig@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 16, 2018 at 2:10 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Apr 16, 2018 at 12:35 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Add Samsung S6E63J0X03 DSI panel driver to enable support for display
>> panel on Exynos3250-based Samsung Rinato board.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  arch/arm/configs/exynos_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index 629189c62fd1..85b2369d6b20 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -208,6 +208,7 @@ CONFIG_DRM_EXYNOS_DSI=y
>>  CONFIG_DRM_EXYNOS_HDMI=y
>>  CONFIG_DRM_PANEL_SIMPLE=y
>>  CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
>> +CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
>
> How about similar (with =m) for multi_v7?

Ah, never mind... I just saw patch #3...

Thanks!
Krzysztof
