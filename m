From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: increase CONFIG_CMA_SIZE_MBYTES
 to 96
Date: Wed, 1 Mar 2017 11:08:52 -0700
Message-ID: <9fd0a9e7-14da-cd4f-b47c-db9fda295105@osg.samsung.com>
References: <20170228191221.18135-1-shuahkh@osg.samsung.com>
 <20170301170910.4vvn4eeolkjbgzw5@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170301170910.4vvn4eeolkjbgzw5@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, cw00.choi@samsung.com, viresh.kumar@linaro.org, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, linux@armlinux.org.uk, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, a.hajda@samsung.com, javier@osg.samsung.com, b.zolnierkie@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, shuah@kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 03/01/2017 10:09 AM, Krzysztof Kozlowski wrote:
> On Tue, Feb 28, 2017 at 12:12:21PM -0700, Shuah Khan wrote:
>> Current CMA size of 64 Mbytes is right on the edge of being small when
>> several drivers need to allocate large CMA buffers.
>>
>> For example, if the s5p-mfc driver needs to pre-allocate N MiB CMA memory
> 
> Everything looks good but I don't get this "N MiB". What do you mean by
> that? If N is infinite (or not known) then how do you know that 96 MiB
> will be enough?

s5p_mfc pre-allocating the default 8MiB at the moment with CMA size of
64 Mbytes H.264 1080p video use0case fails. Works with CMA size = 96 Mbytes.

N in this log meant to cover the deualt case of 8 MiB or any user override
with s5p_mfc.mem=UserSpecifiedM. If this leads to confusion, we can amend
it to say "pre-allocate CMA memory"

Would you like me to amend the changelog with the above change and resend
the patch?

thanks,
-- Shuah


> 
> Best regards,
> Krzysztof
> 
> 
>> to decode a H.264 1080p video, then there won't be enough CMA memory left
>> for other drivers, such as the exynos-drm driver that may need to allocate
>> GEM buffers for the display manager.
>>
>> Increasing CMA size to 96 Mbytes in exynos_defconfig addresses use-cases
>> such as these.
>>
>> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>> Changes since v1:
>> Fix short and long commit log.
>>
>> Reason for this patch:
>> With the proposed s5p_mfc patch series that pre-allocate buffers, when
>> display manager starts, it fails to get GEM buffers.  Increasing the CMA
>> size to 96 solved the problem.
>>
>>  arch/arm/configs/exynos_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index 742baf0..2541414 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -53,7 +53,7 @@ CONFIG_RFKILL_REGULATOR=y
>>  CONFIG_DEVTMPFS=y
>>  CONFIG_DEVTMPFS_MOUNT=y
>>  CONFIG_DMA_CMA=y
>> -CONFIG_CMA_SIZE_MBYTES=64
>> +CONFIG_CMA_SIZE_MBYTES=96
>>  CONFIG_BLK_DEV_LOOP=y
>>  CONFIG_BLK_DEV_CRYPTOLOOP=y
>>  CONFIG_BLK_DEV_RAM=y
>> -- 
>> 2.7.4
>>
