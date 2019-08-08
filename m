From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] clk: samsung: exynos5800: Move MAU subsystem clocks
 to MAU sub-CMU
Date: Thu, 8 Aug 2019 14:14:36 +0200
Message-ID: <fb033201-b798-e3f9-fbdc-0332b422e987@samsung.com>
References: <20190807162456.28694-1-s.nawrocki@samsung.com>
        <CGME20190807162519eucas1p2b9dd9f31cc6e60e0bc935e9a6ceef908@eucas1p2.samsung.com>
        <20190807162456.28694-2-s.nawrocki@samsung.com>
        <eeba8348-4c41-32c5-39f2-c693aafe6c4f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <eeba8348-4c41-32c5-39f2-c693aafe6c4f@samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 8/8/19 13:48, Marek Szyprowski wrote:
>> +static struct exynos5_subcmu_reg_dump exynos5800_mau_suspend_regs[] = {
>> +	{ SRC_TOP9, 0, BIT(8) },
> I would like to add a following comment:
> 
> /* MUX mout_user_mau_epll */
> 
> to the above line to indicate which clock it refers (like it is done for 
> other sub-cmus).
 
Good point, I will resend with that comment added.

-- 
Regards,
Sylwester
