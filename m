From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] clk: s2mps11: Add used attribute to s2mps11_dt_match
Date: Thu, 18 Oct 2018 13:42:24 -0700
Message-ID: <20181018204224.GA7122@flashbox>
References: <20181018191340.30440-1-natechancellor@gmail.com>
 <153989459788.53599.2276628850158968119@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153989459788.53599.2276628850158968119@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Oct 18, 2018 at 01:29:57PM -0700, Stephen Boyd wrote:
> Quoting Nathan Chancellor (2018-10-18 12:13:40)
> > Clang warns after commit 8985167ecf57 ("clk: s2mps11: Fix matching when
> > built as module and DT node contains compatible"):
> > 
> > drivers/clk/clk-s2mps11.c:242:34: warning: variable 's2mps11_dt_match'
> > is not needed and will not be emitted [-Wunneeded-internal-declaration]
> > static const struct of_device_id s2mps11_dt_match[] = {
> >                                  ^
> > 1 warning generated.
> > 
> > This warning happens when a variable is used in some construct that
> > doesn't require a reference to that variable to be emitted in the symbol
> > table; in this case, it's MODULE_DEVICE_TABLE, which only needs to hold
> > the data of the variable, not the variable itself.
> > 
> > $ nm -S drivers/clk/clk-s2mps11.o | rg s2mps11_dt_match
> > 00000078 000003d4 R __mod_of__s2mps11_dt_match_device_table
> > 
> > Normally, with device ID table variables, it means that the variable
> > just needs to be tied to the device declaration at the bottom of the
> > file, like s2mps11_clk_id:
> > 
> > $ nm -S drivers/clk/clk-s2mps11.o | rg s2mps11_clk_id
> > 00000000 00000078 R __mod_platform__s2mps11_clk_id_device_table
> > 00000000 00000078 r s2mps11_clk_id
> > 
> > However, because the comment above this deliberately doesn't want this
> > variable added to .of_match_table, we need to mark s2mps11_dt_match as
> > __used to silence this warning. This makes it clear to Clang that the
> > variable is used for something, even if a reference to it isn't being
> > emitted.
> > 
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> 
> Just curious if this is a common occurrence? Maybe we should make a new
> MODULE_DEVICE_TABLE macro that can declare the table, struct type, and
> add in __used to the declaration like is done here? That way this gotcha
> goes away without us having to remember that the table is used or not
> used somewhere.
> 

I've only had to fix two of these warnings prior to this one, running
arm64 and x86_64 defconfig/allyesconfig builds but as soon as options like
CONFIG_OF or CONFIG_ACPI get turned off, it can happen quite frequently
because things like of_match_ptr and ACPI_PTR turn into NULL, meaning the
variable doesn't have a reference in the symbol table anymore. It would
definitely be nice to avoid having to paper the warnings up.

> Anyway, I'll apply this patch to clk-next.
> 

Thanks!
Nathan
