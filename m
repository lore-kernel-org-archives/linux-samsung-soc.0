From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 26/61] media: platform: exynos4-is: simplify getting
 .drvdata
Date: Tue, 15 May 2018 11:47:49 +0200
Message-ID: <613c3648-1d2e-e008-60a8-d9f21eca9fae@samsung.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
        <20180419140641.27926-27-wsa+renesas@sang-engineering.com>
        <CGME20180515094754epcas2p2715cc9c6376ddbb5f400830ef41b514b@epcas2p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180419140641.27926-27-wsa+renesas@sang-engineering.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/19/2018 04:05 PM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
