From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH] max17042_battery: use SIMPLE_DEV_PM_OPS
Date: Fri, 25 Oct 2013 16:49:48 -0700
Message-ID: <20131025234948.GD13859@teo>
References: <1381728411-21935-1-git-send-email-badarkhe.manish@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:62851 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab3JYXtv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 19:49:51 -0400
Received: by mail-pd0-f177.google.com with SMTP id p10so4598279pdj.36
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 16:49:51 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1381728411-21935-1-git-send-email-badarkhe.manish@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Manish Badarkhe <badarkhe.manish@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dwmw2@infradead.org

On Mon, Oct 14, 2013 at 10:56:51AM +0530, Manish Badarkhe wrote:
> Use the SIMPLE_DEV_PM_OPS macro to declare the driver's
> pm_ops.
> 
> Signed-off-by: Manish Badarkhe <badarkhe.manish@gmail.com>

Applied, thanks!

Anton
