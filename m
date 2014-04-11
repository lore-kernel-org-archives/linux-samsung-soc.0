From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 15/27] ARM: dts: exynos3250: Add uart dt node to support
 seiral ports
Date: Fri, 11 Apr 2014 13:50:33 +0900
Message-ID: <53477499.3030901@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <1397124377-16969-7-git-send-email-cw00.choi@samsung.com>
 <CAK9yfHxdeJarGCYgLADpxYS3BtxLt6hg0NJBrdYqrcKctFqU1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAK9yfHxdeJarGCYgLADpxYS3BtxLt6hg0NJBrdYqrcKctFqU1g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, hyunhee.kim@samsung.com, yj44.cho@samsung.com, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 04/11/2014 01:03 PM, Sachin Kamat wrote:
> On 10 April 2014 15:36, Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> This patch add UART dt node for Exynos3250. Exynos3250 uses same UART IP
>> of Exynos4 SoC and has only two independent channels.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> [Fix incorrect clock id by Tomasz Figa]
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
> 
> typo in patch subject: s/seiral/serial
> 

I'll fix it. Thanks.

Best Regards,
Chanwoo Choi
