From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/6] ARM: EXYNOS: Fix core ID used by platsmp and hotplug
 code
Date: Mon, 14 Jul 2014 11:50:54 +0200
Message-ID: <53C3A7FE.8000401@gmail.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
 <1403618235-19353-3-git-send-email-t.figa@samsung.com>
 <031001cf9aaf$959cf6c0$c0d6e440$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <031001cf9aaf$959cf6c0$c0d6e440$@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

On 08.07.2014 15:21, Kukjin Kim wrote:
> Tomasz Figa wrote:
>>
>> When CPU topology is specified in device tree, cpu_logical_map() does
>> not return core ID anymore, but rather full MPIDR value. This breaks
>> existing calculation of PMU register offsets on Exynos SoCs.
>>
>> This patch fixes the problem by adjusting the code to use only core ID
>> bits of the value returned by cpu_logical_map() to allow CPU topology to
>> be specified in device tree on Exynos SoCs.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> 
> Looks good to me, but I think we don't need this fix in 3.16 because the CPU
> topology is not specified in DT yet...if I'm wrong, please correct me.

CPU topology is already specified in DT for Exynos3250, 5250, 5260, 5410
and 5420/5800.

This patch also fixes CPU hotplug on SoCs with more than 2 cores,
because it removes incorrect condition check in platform_do_lowpower().

Please take this fix for next -rc release.

Best regards,
Tomasz
