From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH] mmc: core: Fix voltage select in DDR mode
Date: Sat, 24 Dec 2011 21:24:11 -0500
Message-ID: <m27h1lz8vo.fsf@bob.laptop.org>
References: <1323950262-2160-1-git-send-email-girish.shivananjappa@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1323950262-2160-1-git-send-email-girish.shivananjappa@linaro.org>
	(Girish K. S.'s message of "Thu, 15 Dec 2011 17:27:42 +0530")
Sender: linux-mmc-owner@vger.kernel.org
To: Girish K S <girish.shivananjappa@linaro.org>
Cc: linux-mmc@vger.kernel.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Philip Rakity <prakity@marvell.com>, Arindam Nath <arindam.nath@amd.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Girish,

On Thu, Dec 15 2011, Girish K S wrote:
> This patch fixes the wrong comparison before setting the interface
> voltage in DDR mode.
>
> The assignment to the variable ddr before comaprison is either
> ddr = MMC_1_2V_DDR_MODE; or ddr == MMC_1_8V_DDR_MODE. But the comparison
> is done wth the extended csd value if (ddr == EXT_CSD_CARD_TYPE_DDR_1_2V)
>
> cc: Philip Rakity <prakity@marvell.com>
> cc: Arindam Nath <arindam.nath@amd.com>
> cc: Chris Ball <cjb@laptop.org>
> Signed-off-by: Girish K S <girish.shivananjappa@linaro.org>

Pushed to mmc-next for 3.3 with ACKs from Philip and Subhash and a
stable@ tag, thanks.  (It's too late for 3.2.)

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
