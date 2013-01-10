From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 2/3] sta2x11_vip: convert to videobuf2 and control
 framework
Date: Thu, 10 Jan 2013 17:01:50 +0300
Message-ID: <20130110140150.GA19949@mwanda>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
 <1357822010-30419-3-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1357822010-30419-3-git-send-email-federico.vaga@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Federico Vaga <federico.vaga@gmail.com>
Cc: Kamil Debski <k.debski@samsung.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Sungchun Kang <sungchun.kang@samsung.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Pawel Osciak <pawel@osciak.com>, Scott Jiang <scott.jiang.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>Andrzej Pietrasiewicz <and>
List-Id: linux-samsung-soc@vger.kernel.org

This would be easier to review if it were broken up into separate
patches.

1) There are superflous white spaces changes
2) Changes to the copyright
3) pr_warning => pr_warn
4) The REG_READ and REG_WRITE macros are now inline functions
5) KBUILD_MODNAME is used instead of DRV_NAME
6) It now uses the video_drvdata() function
7) Lots of comments deleted.  For exmple, vidioc_enum_fmt_vid_cap()
   didn't change.  Just the comments were deleted.
8) Comments added for existing code.
9) Other behavior changes not related to using videobuf2 like in
   vidioc_try_fmt_vid_cap().
10) etc...

If all the uninteresting changes are in separate patches it makes
the complicated stuff much shorter and easier to review.

regards,
dan carpenter
