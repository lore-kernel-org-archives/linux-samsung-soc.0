From: kgene@kernel.org
Subject: RE: [PATCH 1/1] ata: pata_samsung_cf: Move plat/regs-ata.h to
 drivers/ata
Date: Sat, 04 Jan 2014 11:25:05 +0900
Message-ID: <22fa01cf08f4$2e496c80$8adc4580$@kernel.org>
References: <1388467753-24431-1-git-send-email-sachin.kamat@linaro.org>
 <20131231113428.GA3985@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-reply-to: <20131231113428.GA3985@htj.dyndns.org>
Content-language: ko
Sender: linux-ide-owner@vger.kernel.org
To: 'Tejun Heo' <tj@kernel.org>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-ide@vger.kernel.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Tejun Heo wrote:
> 
> On Tue, Dec 31, 2013 at 10:59:13AM +0530, Sachin Kamat wrote:
> > plat/regs-ata.h is used only by Samsung PATA driver.
> > Move this file to the drivers folder to remove platform
> > dependency required for multiplatform support.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> Applied to libata/for-3.14.
> 
> As this is only used by pata_samsung_cf.c, can you please follow up
> with a patch to roll pata_samsung_cf.h into .c?  There's no point in
> creating separate header files for stuff which isn't shared among
> multiple files.
> 
Oops, I read this just now ;-)

Tejun, if you've applied this in your tree already, I'm OK so please kindly
ignore my previous reply.

Sachin, when you move the definitions into the .c file per Tejun's
suggestion, please cleanup useless definitions.

Thanks and happy new year.
- Kukjin

