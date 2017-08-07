From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 11/12] [media] exynos4-is: constify v4l2_m2m_ops
 structures
Date: Mon, 07 Aug 2017 12:19:36 +0200
Message-ID: <dc25a655-df4a-3301-384a-00c85f0ee6d8@samsung.com>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
        <1502007921-22968-12-git-send-email-Julia.Lawall@lip6.fr>
        <CGME20170807101941epcas2p446c04b9a0813cb56f33202e6b4fdc49b@epcas2p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1502007921-22968-12-git-send-email-Julia.Lawall@lip6.fr>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-media@vger.kernel.org
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/06/2017 10:25 AM, Julia Lawall wrote:
> The v4l2_m2m_ops structures are only passed as the only
> argument to v4l2_m2m_init, which is declared as const.
> Thus the v4l2_m2m_ops structures themselves can be const.
> 
> Done with the help of Coccinelle.

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
