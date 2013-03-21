From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 2/2] i2c: pxa: Use i2c-core to get bus number now
Date: Thu, 21 Mar 2013 12:49:43 +0100
Message-ID: <20130321114943.GH19297@the-dreams.de>
References: <1360630085-26874-1-git-send-email-dianders@chromium.org>
 <1362157052-16738-1-git-send-email-dianders@chromium.org>
 <1362157052-16738-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1362157052-16738-3-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-i2c@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Thomas Abraham <thomas.abraham@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Karol Lewandowski <k.lewandowsk@samsung.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 01, 2013 at 08:57:32AM -0800, Doug Anderson wrote:
> The commit: "i2c-core: dt: Pick i2c bus number from i2c alias if
> present" adds support for automatically picking the bus number based
> on the alias ID.  Remove the now unnecessary code from i2c-pxa that
> did the same thing.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Thanks, applied for-next.
