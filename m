From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: samsung: exynos4: fix refcount leak in exynos4_get_xom()
Date: Fri, 28 Dec 2018 11:35:08 -0800
Message-ID: <154602570854.179992.17215224103148425228@swboyd.mtv.corp.google.com>
References: <20181226133215.4939-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181226133215.4939-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Yangtao Li (2018-12-26 05:32:15)
> The of_find_compatible_node() returns a node pointer with refcount
> incremented, but there is the lack of use of the of_node_put() when
> done. Add the missing of_node_put() to release the refcount.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---

Applied to clk-next
