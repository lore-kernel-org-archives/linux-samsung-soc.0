From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4 2/5] ARM: dts: Add disable-wp for sd card slot on
 smdk5250
Date: Mon, 14 Jan 2013 22:27:16 -0800
Message-ID: <20130115062716.GB20105@quad.lixom.net>
References: <1357842269-15062-1-git-send-email-dianders@chromium.org>
 <1357923834-31641-1-git-send-email-dianders@chromium.org>
 <1357923834-31641-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1357923834-31641-2-git-send-email-dianders@chromium.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Will Newton <will.newton@imgtec.com>, Chris Ball <cjb@laptop.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Rahul Sharma <rahul.sharma@samsung.com>, Arun Kumar K <arun.kk@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 11, 2013 at 09:03:51AM -0800, Doug Anderson wrote:
> The next change will remove the code from the dw_mmc-exynos that added
> the DW_MCI_QUIRK_NO_WRITE_PROTECT.  Keep existing functionality of
> having no write protect pin on smdk5250 by adding the disable-wp
> property.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Seungwon Jeon <tgih.jun@samsung.com>

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
