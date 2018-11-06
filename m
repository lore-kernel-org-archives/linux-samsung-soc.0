From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/8] clk: s2mps11: constify clk_ops structure
Date: Tue, 06 Nov 2018 09:43:44 -0800
Message-ID: <154152622426.88331.17363838226504925494@swboyd.mtv.corp.google.com>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Julia Lawall (2018-10-26 22:47:40)
> The clk_ops structure is only stored in the ops fields of
> clk_init_data structures.  This field is const, so the clk_ops
> structure can be const as well.
> =

> Identified and transformed using Coccinelle.
> =

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> =

> ---

Applied to clk-next
