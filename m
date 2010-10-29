From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 0/2] ARM: SAMSUNG: Add Support Power Domain Control
Date: Sat, 30 Oct 2010 00:26:14 +0100
Message-ID: <4CCB5816.4040609@fluff.org>
References: <1286970422-15993-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from host-92-14-223-225.as43234.net ([92.14.223.225]:37334 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1762169Ab0J2Xgg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Oct 2010 19:36:36 -0400
In-Reply-To: <1286970422-15993-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org

On 13/10/10 12:47, Kukjin Kim wrote:
> This patch adds support Power Domain Control based on Runtim PM.
> 
> Each Power Domain is represented by a Power Domain device and the devices
> belong to these Power Domains should be set as a child device of the Power
> Domain devices. The corresponding drivers of the devices should implement
> Runtime PM to control the Power Domains.

This sounds like a reasonable way to do this, although we still
need a way of signaling the drivers whether they've fully powered
down or not.
