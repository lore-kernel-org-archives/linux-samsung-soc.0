From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: Re: [PATCH] arm: exynos increase CONFIG_CMA_SIZE_MBYTES to 96
Date: Tue, 28 Feb 2017 09:52:33 -0700
Message-ID: <82fe7b00-b1bc-cd32-8ff1-a079adfd8607@osg.samsung.com>
References: <20170228002353.3101-1-shuahkh@osg.samsung.com>
 <28dfa72b-13f5-2674-92de-d5a264a89e1a@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <28dfa72b-13f5-2674-92de-d5a264a89e1a@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux@armlinux.org.uk, kgene@kernel.org, krzk@kernel.org, arnd@arndb.de, cw00.choi@samsung.com, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, b.zolnierkie@samsung.com, viresh.kumar@linaro.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Shuah Khan <shuahkh@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 02/28/2017 09:42 AM, Javier Martinez Canillas wrote:
> Hello Shuah,
> 
> The subject line isn't consistent with what's used for exynos_defconfig
> changes, please use instead:
> 
> ARM: exynos_defconfig: Increase CONFIG_CMA_SIZE_MBYTES to 96
> 

oops - I meant o make it exynos_defconfig

> On 02/27/2017 09:23 PM, Shuah Khan wrote:
>> Current CMA size of 64 Mbytes is right on the edge of being too small
>> for some display managers.  With the proposed s5p_mfc patch series that
>> pre-allocate buffers, when display manager starts, it fails to get GEM
>> buffers.  Increasing the CMA size to 96 solves the problem.
>>
>> Change CONFIG_CMA_SIZE_MBYTES to 96 in exynos_defconfig to address the
>> problem.
>>
> 
> As you mention, the problem is when a driver pre-allocates a lot of CMA
> memory. So instead of mentioning an in-flight patch series, I would make
> the commit message more generic. Something along the following lines:

I thought about making it generic and decided to mention the problem I am
seeing, so there is a context to it. Without this patch, some display
managers will see regression.

> 
> Current CMA size is 64 Mbytes, but this may not be enough if different
> drivers need to allocate big memory chunks.
> 
> For example, the s5p-mfc driver may need to do a pre-allocation of N MiB
> to decode a H.264 1080p video, and there won't be enough CMA memory left
> for others drivers, like the exynos-drm driver that may need to allocate
> GEM buffers for the display manager.
> 
> Increasing the CMA size to 96 MiB should be enough for most use cases.

I will add the current problem to throw away section of the patch for more
information.

> 
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
> 
> Patch looks good to me though.
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

thanks for the review. I will send v2 with your reviewed by tag
> 
> Best regards,
> 

-- Shuah
