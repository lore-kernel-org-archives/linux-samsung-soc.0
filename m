From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 03/27] ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
Date: Mon, 14 Apr 2014 15:04:48 +0900
Message-ID: <534B7A80.3010509@samsung.com>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-4-git-send-email-cw00.choi@samsung.com>
 <4996376.GgWd9rnCP3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <4996376.GgWd9rnCP3@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Arnd and Kukjin,

On 04/10/2014 06:46 PM, Arnd Bergmann wrote:
> On Thursday 10 April 2014 18:28:20 Chanwoo Choi wrote:
>> This patch add memory mapping for PMU (Power Management Unit) which is used
>> for power control of Exynos3250.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Same thing as for the SRAM here, can you work on making this a proper
> driver instead?
> 

As Chanho Park said, Sachin already submitted the DT support[1] for SYSRAM area.
[1] : http://www.spinics.net/lists/linux-samsung-soc/msg27647.html

But, this patch has not yet to merge git repository(linux-samsung.git, arm-soc.git).
So, I'll make a driver to handle PMU memory mapping after Sachin's patch is merged.

Best Regards,
Chanwoo Choi
