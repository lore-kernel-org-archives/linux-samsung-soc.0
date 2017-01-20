From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] [media] exynos-gsc: Fix imprecise external abort due
 disabled power domain
Date: Fri, 20 Jan 2017 10:36:46 -0300
Message-ID: <5d223b5f-585d-c6a0-0773-d9e42ec3f3a9@osg.samsung.com>
References: <1484699402-28738-1-git-send-email-javier@osg.samsung.com>
 <CGME20170118003022epcas3p34cf03bb6feb830c4fa231497f2536d0e@epcas3p3.samsung.com>
 <1484699402-28738-2-git-send-email-javier@osg.samsung.com>
 <cc9c6837-7141-b63c-ddf6-68252493df11@samsung.com>
 <842737f2-3faf-7b22-c480-93e183bbb670@osg.samsung.com>
 <20ecbcee-0dfd-04f6-a855-e117ba05732f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20ecbcee-0dfd-04f6-a855-e117ba05732f@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 01/20/2017 05:08 AM, Marek Szyprowski wrote:

[snip]

>>
>> This seems to be caused by some needed clocks to access the power domains
>> to be gated, since I don't get these erros when passing clk_ignore_unused
>> as parameter in the kernel command line.
> 
> I think that those issues were fixes by the following patch:
> https://patchwork.kernel.org/patch/9484607/
> It still didn't reach mainline, but I hope it will go as a fix to v4.10.
> 

Argh, I missed on a first read that the patch you mentioned already marks
CLK_ACLK432_SCALER as CLK_IS_CRITICAL. So please also ignore my clk patch.

Sorry for the noise and the mess with these patches. Thought I also tested
on linux-next to see if the issue was solved there, but it seems I didn't.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
