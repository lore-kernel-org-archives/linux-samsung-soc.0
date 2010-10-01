From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [patch 1/1] i2c-s3c2410: Enable i2c clock only when doing some transfert
Date: Fri, 1 Oct 2010 09:34:37 +0300
Message-ID: <201010010934.37596.anarsoul@gmail.com>
References: <20100715130636.136905589@rtp-net.org> <201007231202.54301.anarsoul@gmail.com> <201008272233.00652.anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:63846 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753123Ab0JAGgF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 02:36:05 -0400
In-Reply-To: <201008272233.00652.anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>
Cc: ben-linux@fluff.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 27 of August 2010 22:33:00 Vasily Khoruzhick wrote:

> This patch has problem with suspend/resume, clock needs to be enabled on
> i2c re-init. Here's fixed version of patch in attachment.

Ping
