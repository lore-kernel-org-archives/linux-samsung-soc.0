From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos5: Fix kfree() of const memory on setting driver_override
Date: Thu, 21 Feb 2019 13:33:12 -0800
Message-ID: <155078479299.77512.7336673875297969172@swboyd.mtv.corp.google.com>
References: <1550749552-8133-1-git-send-email-krzk@kernel.org> <1550749552-8133-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1550749552-8133-3-git-send-email-krzk@kernel.org>
Sender: stable-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2019-02-21 03:45:52)
> Platform driver driver_override field should not be initialized from
> const memory because the core later kfree() it.  If driver_override is
> manually set later through sysfs, kfree() of old value leads to:
>=20
>     $ echo "new_value" > /sys/bus/platform/drivers/.../driver_override
>=20
>     kernel BUG at ../mm/slub.c:3960!
>     Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>     ...
>     (kfree) from [<c058e8c0>] (platform_set_driver_override+0x84/0xac)
>     (platform_set_driver_override) from [<c058e908>] (driver_override_sto=
re+0x20/0x34)
>     (driver_override_store) from [<c031f778>] (kernfs_fop_write+0x100/0x1=
dc)
>     (kernfs_fop_write) from [<c0296de8>] (__vfs_write+0x2c/0x17c)
>     (__vfs_write) from [<c02970c4>] (vfs_write+0xa4/0x188)
>     (vfs_write) from [<c02972e8>] (ksys_write+0x4c/0xac)
>     (ksys_write) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
>=20
> The clk-exynos5-subcmu driver uses override only for the purpose of
> creating meaningful names for children devices (matching names of power
> domains, e.g. DISP, MFC).  The driver_override was not developed for
> this purpose so just switch to default names of devices to fix the
> issue.
>=20
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to clk-next
