From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Fri, 10 Feb 2012 18:54:47 +0100
Message-ID: <4F3559E7.7060904@samsung.com>
References: <1324624169-16102-1-git-send-email-riverful.kim@samsung.com>
 <1327652483-15655-1-git-send-email-riverful.kim@samsung.com>
 <CAJuYYwRn7Luhj0223-i9u3ETutb8qgFUY7FEBq-ZOUi74DouMA@mail.gmail.com>
 <CAH9JG2VLxmsafu09RmU5GPXnQUMnJo8XZSQcKTkBD2ZpnZ6yPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAH9JG2VLxmsafu09RmU5GPXnQUMnJo8XZSQcKTkBD2ZpnZ6yPQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, "HeungJun,
 Kim" <riverful.kim@samsung.com>, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10.02.2012 09:01, Kyungmin Park wrote:

> + Karol for DT support later
> 
> On Fri, Feb 10, 2012 at 3:58 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
>> Dear Mr. HeungJun Kim,
>>
>> On 27 January 2012 00:21, HeungJun, Kim <riverful.kim@samsung.com> wrote:
>>> This patch adds Samsung Mobile TRATS board support.
>>>
>>> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>>  arch/arm/mach-exynos/Kconfig      |   11 ++
>>>  arch/arm/mach-exynos/Makefile     |    1 +
>>>  arch/arm/mach-exynos/mach-trats.c |  344 +++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 356 insertions(+), 0 deletions(-)
>>>  create mode 100644 arch/arm/mach-exynos/mach-trats.c
>>
>> The exynos4 dt-enabled board file can support most of the features
>> added in this board file. The other option that could be considered
>> here would be to add DT support for this board file, and use AUX_DATA
>> to supply platform data for drivers that do not have dt support yet.
>> It would be better to use dt support for new board support that we
>> add.


Thanks to Thomas' work TRATS can be booted today using exynos4-dt.
However, we are still missing some bits needed to make it fully functional:

 - sdhci-s3c patchset[1] is needed for eMMC support

   http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/9216

 - irq-eint[2] and max8997-pmic[3] for regulators

   [2] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/8197
   [3] http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/8865

These patches (created entirely by Thomas) would allow me to write
description (dts) that should cover what mach-trats.c did.

However, due to ongoing irqdomain and related changes I assume this
might take a while.

Thomas, may I ask about your plans wrt to irqdomains and wakeup/eints
(this [2] patchset)?

Regards,
-- 
Karol Lewandowski | Samsung Poland R&D Center | Linux/Platform
