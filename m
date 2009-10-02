From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5] S3C: sdhci: Update Samsung 6410 SDHCI driver.
Date: Fri, 02 Oct 2009 13:48:03 +0900
Message-ID: <003c01ca431b$87785a30$96690e90$%kim@samsung.com>
References: <33519709.339161254183501956.JavaMail.weblogic@epml10>
 <20091001125238.GD14417@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64357 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752789AbZJBEqY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Oct 2009 00:46:24 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KQV00LK5ELFW8@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Oct 2009 13:46:27 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KQV00HI0ELESF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Oct 2009 13:46:27 +0900 (KST)
In-reply-to: <20091001125238.GD14417@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'THOMAS P ABRAHAM' <thomas.ab@samsung.com>
Cc: 'Peter Korsgaard' <jacmet@sunsite.dk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Mark Brown,

On Thu, Oct 01, 2009 at 21:53PM +0900, Mark Brown wrote:
> On Tue, Sep 29, 2009 at 12:18:22AM +0000, THOMAS P ABRAHAM wrote:
> 
> > It has been decided that the patches will be submitted to the
> > linux-samsung-soc mailing list for initial review. After all comments
> > are addressed, the patches will be submitted to Ben and
> > linux-arm-kernel mailing list. This will help to resolve any simple
> > issues which otherwise Ben will have to spend time looking into.
> 
> Could you clarify what the policy is here?  I've noticed that some of
> the patches posted to this list are being sent to Ben directly which
> seems to work against the goal of cleaning stuff up pre-submission.

My name is Kukjin Kim.
I work for Samsung Electronics, System LSI division which makes Samsung SoCs
(e.g. S3C24XX, S3C6410, S5PC100, ...).

My team want to submit/push (new) Samsung SoCs' linux codes to mainline.

We need to do sufficient review of the patches with many developers who
interested in Samsung SoCs before we submit it to linux-arm-kernel mailing
list.
The policy is submit to linux-arm-kernel mailing list after review is
complete at linux-samsung-soc mailing list.

We (Samsung System LSI) had a meeting with Ben Dooks and Harald Welte at
Samsung, and decided this model.
Samsung System LSI will continue to use this model.

When required, Ben can be copied in the email if Ben's attention is required
for the patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.

