From: Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v3 02/12] s3c-fb: Correct FRAMESEL1 bitfield defines for
 VIDINTCON0 register
Date: Fri, 02 Jul 2010 11:51:27 +0100
Message-ID: <4C2DC4AF.7080906@simtec.co.uk>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com> <1277712538-23188-3-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:40237 "EHLO
	preston.local.simtec.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751869Ab0GBKvb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 06:51:31 -0400
In-Reply-To: <1277712538-23188-3-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pawel Osciak <p.osciak@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On 28/06/10 09:08, Pawel Osciak wrote:
> FRAMESEL1 bitfield starts on 13th bit, not on 14th.
> 
> Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
