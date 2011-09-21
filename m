From: Chris Ball <cjb@laptop.org>
Subject: Re: [PATCH v2 1/2] mmc: sdhci-s3c: add default controller configuration
Date: Wed, 21 Sep 2011 08:18:34 -0400
Message-ID: <m2boue6qcl.fsf@bob.laptop.org>
References: <1315984158-29651-1-git-send-email-thomas.abraham@linaro.org>
	<1315984158-29651-2-git-send-email-thomas.abraham@linaro.org>
	<002501cc784d$1618f110$424ad330$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <002501cc784d$1618f110$424ad330$%kim@samsung.com> (Kukjin Kim's
	message of "Wed, 21 Sep 2011 19:56:16 +0900")
Sender: linux-mmc-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wed, Sep 21 2011, Kukjin Kim wrote:
> Acked-by: Kukjin Kim <kgene.kim@samsung.com>
>
> Hi Chris,
>
> This is ok to me. Could you please pick this up in your tree so that I can
> pick 2nd patch up in my tree.
>
> As you know, this patch has no dependency with patch2/2 so that you can
> handle without any conflicts.

Thanks, pushed to mmc-next for 3.2.

I've been waiting for kernel.org to come back up, but I think later
today I'll just move mmc-next to git://dev.laptop.org/users/cjb/mmc,
so this will be available in linux-next soon.

- Chris.
-- 
Chris Ball   <cjb@laptop.org>   <http://printf.net/>
One Laptop Per Child
