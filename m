From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v3 03/12] s3c-fb: Separate S5PC100 and S5PV210 framebuffer
 driver data structures
Date: Fri, 02 Jul 2010 12:12:06 +0100
Message-ID: <4C2DC986.7040705@simtec.co.uk>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com> <1277712538-23188-4-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:48826 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752142Ab0GBLMJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 07:12:09 -0400
In-Reply-To: <1277712538-23188-4-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pawel Osciak <p.osciak@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On 28/06/10 09:08, Pawel Osciak wrote:
> S5PC100 and S5PV210 framebuffer devices differ slightly in terms of
> available registers and their driver data structures have to be separate.

Would have been nice to note which ones changes, otherwise ok.
