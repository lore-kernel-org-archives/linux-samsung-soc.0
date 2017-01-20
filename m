From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5420: Mark CLK_ACLK432_SCALER as
 CLK_IS_CRITICAL
Date: Fri, 20 Jan 2017 11:07:00 -0300
Message-ID: <6af43673-85eb-7b7d-a7f9-a7bac5070bdb@osg.samsung.com>
References: <CGME20170120104148epcas5p11af0e630f0881092a9b3b43e8b5b1aac@epcas5p1.samsung.com>
 <1484908891-11820-1-git-send-email-javier@osg.samsung.com>
 <551ac156-0cfa-29be-335f-d8a1f171cd8a@samsung.com>
 <0ffa0d28-1086-887c-dcfc-590b6146b03e@samsung.com>
 <48a2f141-4275-cb79-aafd-62191d747107@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <48a2f141-4275-cb79-aafd-62191d747107@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Shuah Khan <shuahkh@osg.samsung.com>, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 01/20/2017 11:00 AM, Javier Martinez Canillas wrote:
> On 01/20/2017 10:55 AM, Sylwester Nawrocki wrote:

[snip]

>>
>> Oops, the $subject patch can be dropped since as Marek just pointed out
>> to me the changes introduced by that patch are already included in a patch
>> which is already in the v4.10 fixes queue:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=318fa46cc60d37fec1e87dbf03a82aca0f5ce695
>>
> 
> Yes, I just answered to Marek in the other thread saying the same.
> He did mention the patch could fix the issue but for some reason I
> didn't see the CLK_ACLK_300_GSCL in the clocks marked as critical...
>

err, I meant s/CLK_ACLK_300_GSCL/CLK_ACLK432_SCALER

I should just stop writing emails today since clearly didn't get enough coffee.
 
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
