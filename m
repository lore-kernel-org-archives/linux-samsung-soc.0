From: Federico Vaga <federico.vaga@gmail.com>
Subject: Re: [PATCH v5 2/3] sta2x11_vip: convert to videobuf2 and control
 framework
Date: Thu, 10 Jan 2013 15:58:30 +0100
Message-ID: <1709069.IhsscPIK3z@harkonnen>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
 <3596574.18Q2Rh4jo9@harkonnen> <201301101541.01082.hansverk@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <201301101541.01082.hansverk@cisco.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hansverk@cisco.com>
Cc: Kamil Debski <k.debski@samsung.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Pawel Osciak <pawel@osciak.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Sylwester
List-Id: linux-samsung-soc@vger.kernel.org

> To see the warning you need to run v4l2-compliance with the '-v1' option.
> 
> Hmm, I think I should probably change v4l2-compliance to show warnings by
> default and add an option that surpresses warnings. That might work better.

I was expecting warning information by default

-- 
Federico Vaga
