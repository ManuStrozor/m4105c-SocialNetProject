<%@ Page Title="" Language="C#" MasterPageFile="~/TimeLine.Master" AutoEventWireup="true" CodeBehind="TimeLine_EditEducations.aspx.cs" Inherits="SocialNetProject.Edit_Educations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="editing-info">
    <h5 class="f-title"><i class="ti-info-alt"></i> Edit work & Education</h5>
    <div class="checkbox">
        <label>
            <asp:CheckBox ID="CheckBox1" runat="server" /><i class="check-box"></i>Graduate
        </label>
    </div>
    <div class="form-group">	
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <label class="control-label" for="input">Studying at</label><i class="mtrl-select"></i>
    </div>
    <div class="form-group half">
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <label class="control-label" for="input">From</label><i class="mtrl-select"></i>
    </div>
    <div class="form-group half">	
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <label class="control-label" for="input">To</label><i class="mtrl-select"></i>
    </div>												
    <div class="form-group">	
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <label class="control-label" for="input">City</label><i class="mtrl-select"></i>
    </div>
    <div class="form-group">
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem value="AFG">Afghanistan</asp:ListItem>
            <asp:ListItem value="ALA">Ƭand Islands</asp:ListItem>
            <asp:ListItem value="ALB">Albania</asp:ListItem>
            <asp:ListItem value="DZA">Algeria</asp:ListItem>
            <asp:ListItem value="ASM">American Samoa</asp:ListItem>
            <asp:ListItem value="AND">Andorra</asp:ListItem>
            <asp:ListItem value="AGO">Angola</asp:ListItem>
            <asp:ListItem value="AIA">Anguilla</asp:ListItem>
            <asp:ListItem value="ATA">Antarctica</asp:ListItem>
            <asp:ListItem value="ATG">Antigua and Barbuda</asp:ListItem>
            <asp:ListItem value="ARG">Argentina</asp:ListItem>
            <asp:ListItem value="ARM">Armenia</asp:ListItem>
            <asp:ListItem value="ABW">Aruba</asp:ListItem>
            <asp:ListItem value="AUS">Australia</asp:ListItem>
            <asp:ListItem value="AUT">Austria</asp:ListItem>
            <asp:ListItem value="AZE">Azerbaijan</asp:ListItem>
            <asp:ListItem value="BHS">Bahamas</asp:ListItem>
            <asp:ListItem value="BHR">Bahrain</asp:ListItem>
            <asp:ListItem value="BGD">Bangladesh</asp:ListItem>
            <asp:ListItem value="BRB">Barbados</asp:ListItem>
            <asp:ListItem value="BLR">Belarus</asp:ListItem>
            <asp:ListItem value="BEL">Belgium</asp:ListItem>
            <asp:ListItem value="BLZ">Belize</asp:ListItem>
            <asp:ListItem value="BEN">Benin</asp:ListItem>
            <asp:ListItem value="BMU">Bermuda</asp:ListItem>
            <asp:ListItem value="BTN">Bhutan</asp:ListItem>
            <asp:ListItem value="BOL">Bolivia, Plurinational State of</asp:ListItem>
            <asp:ListItem value="BES">Bonaire, Sint Eustatius and Saba</asp:ListItem>
            <asp:ListItem value="BIH">Bosnia and Herzegovina</asp:ListItem>
            <asp:ListItem value="BWA">Botswana</asp:ListItem>
            <asp:ListItem value="BVT">Bouvet Island</asp:ListItem>
            <asp:ListItem value="BRA">Brazil</asp:ListItem>
            <asp:ListItem value="IOT">British Indian Ocean Territory</asp:ListItem>
            <asp:ListItem value="BRN">Brunei Darussalam</asp:ListItem>
            <asp:ListItem value="BGR">Bulgaria</asp:ListItem>
            <asp:ListItem value="BFA">Burkina Faso</asp:ListItem>
            <asp:ListItem value="BDI">Burundi</asp:ListItem>
            <asp:ListItem value="KHM">Cambodia</asp:ListItem>
            <asp:ListItem value="CMR">Cameroon</asp:ListItem>
            <asp:ListItem value="CAN">Canada</asp:ListItem>
            <asp:ListItem value="CPV">Cape Verde</asp:ListItem>
            <asp:ListItem value="CYM">Cayman Islands</asp:ListItem>
            <asp:ListItem value="CAF">Central African Republic</asp:ListItem>
            <asp:ListItem value="TCD">Chad</asp:ListItem>
            <asp:ListItem value="CHL">Chile</asp:ListItem>
            <asp:ListItem value="CHN">China</asp:ListItem>
            <asp:ListItem value="CXR">Christmas Island</asp:ListItem>
            <asp:ListItem value="CCK">Cocos (Keeling) Islands</asp:ListItem>
            <asp:ListItem value="COL">Colombia</asp:ListItem>
            <asp:ListItem value="COM">Comoros</asp:ListItem>
            <asp:ListItem value="COG">Congo</asp:ListItem>
            <asp:ListItem value="COD">Congo, the Democratic Republic of the</asp:ListItem>
            <asp:ListItem value="COK">Cook Islands</asp:ListItem>
            <asp:ListItem value="CRI">Costa Rica</asp:ListItem>
            <asp:ListItem value="CIV">C𴥠d'Ivoire</asp:ListItem>
            <asp:ListItem value="HRV">Croatia</asp:ListItem>
            <asp:ListItem value="CUB">Cuba</asp:ListItem>
            <asp:ListItem value="CUW">Cura袯</asp:ListItem>
            <asp:ListItem value="CYP">Cyprus</asp:ListItem>
            <asp:ListItem value="CZE">Czech Republic</asp:ListItem>
            <asp:ListItem value="DNK">Denmark</asp:ListItem>
            <asp:ListItem value="DJI">Djibouti</asp:ListItem>
            <asp:ListItem value="DMA">Dominica</asp:ListItem>
            <asp:ListItem value="DOM">Dominican Republic</asp:ListItem>
            <asp:ListItem value="ECU">Ecuador</asp:ListItem>
            <asp:ListItem value="EGY">Egypt</asp:ListItem>
            <asp:ListItem value="SLV">El Salvador</asp:ListItem>
            <asp:ListItem value="GNQ">Equatorial Guinea</asp:ListItem>
            <asp:ListItem value="ERI">Eritrea</asp:ListItem>
            <asp:ListItem value="EST">Estonia</asp:ListItem>
            <asp:ListItem value="ETH">Ethiopia</asp:ListItem>
            <asp:ListItem value="FLK">Falkland Islands (Malvinas)</asp:ListItem>
            <asp:ListItem value="FRO">Faroe Islands</asp:ListItem>
            <asp:ListItem value="FJI">Fiji</asp:ListItem>
            <asp:ListItem value="FIN">Finland</asp:ListItem>
            <asp:ListItem value="FRA">France</asp:ListItem>
            <asp:ListItem value="GUF">French Guiana</asp:ListItem>
            <asp:ListItem value="PYF">French Polynesia</asp:ListItem>
            <asp:ListItem value="ATF">French Southern Territories</asp:ListItem>
            <asp:ListItem value="GAB">Gabon</asp:ListItem>
            <asp:ListItem value="GMB">Gambia</asp:ListItem>
            <asp:ListItem value="GEO">Georgia</asp:ListItem>
            <asp:ListItem value="DEU">Germany</asp:ListItem>
            <asp:ListItem value="GHA">Ghana</asp:ListItem>
            <asp:ListItem value="GIB">Gibraltar</asp:ListItem>
            <asp:ListItem value="GRC">Greece</asp:ListItem>
            <asp:ListItem value="GRL">Greenland</asp:ListItem>
            <asp:ListItem value="GRD">Grenada</asp:ListItem>
            <asp:ListItem value="GLP">Guadeloupe</asp:ListItem>
            <asp:ListItem value="GUM">Guam</asp:ListItem>
            <asp:ListItem value="GTM">Guatemala</asp:ListItem>
            <asp:ListItem value="GGY">Guernsey</asp:ListItem>
            <asp:ListItem value="GIN">Guinea</asp:ListItem>
            <asp:ListItem value="GNB">Guinea-Bissau</asp:ListItem>
            <asp:ListItem value="GUY">Guyana</asp:ListItem>
            <asp:ListItem value="HTI">Haiti</asp:ListItem>
            <asp:ListItem value="HMD">Heard Island and McDonald Islands</asp:ListItem>
            <asp:ListItem value="VAT">Holy See (Vatican City State)</asp:ListItem>
            <asp:ListItem value="HND">Honduras</asp:ListItem>
            <asp:ListItem value="HKG">Hong Kong</asp:ListItem>
            <asp:ListItem value="HUN">Hungary</asp:ListItem>
            <asp:ListItem value="ISL">Iceland</asp:ListItem>
            <asp:ListItem value="IND">India</asp:ListItem>
            <asp:ListItem value="IDN">Indonesia</asp:ListItem>
            <asp:ListItem value="IRN">Iran, Islamic Republic of</asp:ListItem>
            <asp:ListItem value="IRQ">Iraq</asp:ListItem>
            <asp:ListItem value="IRL">Ireland</asp:ListItem>
            <asp:ListItem value="IMN">Isle of Man</asp:ListItem>
            <asp:ListItem value="ISR">Israel</asp:ListItem>
            <asp:ListItem value="ITA">Italy</asp:ListItem>
            <asp:ListItem value="JAM">Jamaica</asp:ListItem>
            <asp:ListItem value="JPN">Japan</asp:ListItem>
            <asp:ListItem value="JEY">Jersey</asp:ListItem>
            <asp:ListItem value="JOR">Jordan</asp:ListItem>
            <asp:ListItem value="KAZ">Kazakhstan</asp:ListItem>
            <asp:ListItem value="KEN">Kenya</asp:ListItem>
            <asp:ListItem value="KIR">Kiribati</asp:ListItem>
            <asp:ListItem value="PRK">Korea, Democratic People's Republic of</asp:ListItem>
            <asp:ListItem value="KOR">Korea, Republic of</asp:ListItem>
            <asp:ListItem value="KWT">Kuwait</asp:ListItem>
            <asp:ListItem value="KGZ">Kyrgyzstan</asp:ListItem>
            <asp:ListItem value="LAO">Lao People's Democratic Republic</asp:ListItem>
            <asp:ListItem value="LVA">Latvia</asp:ListItem>
            <asp:ListItem value="LBN">Lebanon</asp:ListItem>
            <asp:ListItem value="LSO">Lesotho</asp:ListItem>
            <asp:ListItem value="LBR">Liberia</asp:ListItem>
            <asp:ListItem value="LBY">Libya</asp:ListItem>
            <asp:ListItem value="LIE">Liechtenstein</asp:ListItem>
            <asp:ListItem value="LTU">Lithuania</asp:ListItem>
            <asp:ListItem value="LUX">Luxembourg</asp:ListItem>
            <asp:ListItem value="MAC">Macao</asp:ListItem>
            <asp:ListItem value="MKD">Macedonia, the former Yugoslav Republic of</asp:ListItem>
            <asp:ListItem value="MDG">Madagascar</asp:ListItem>
            <asp:ListItem value="MWI">Malawi</asp:ListItem>
            <asp:ListItem value="MYS">Malaysia</asp:ListItem>
            <asp:ListItem value="MDV">Maldives</asp:ListItem>
            <asp:ListItem value="MLI">Mali</asp:ListItem>
            <asp:ListItem value="MLT">Malta</asp:ListItem>
            <asp:ListItem value="MHL">Marshall Islands</asp:ListItem>
            <asp:ListItem value="MTQ">Martinique</asp:ListItem>
            <asp:ListItem value="MRT">Mauritania</asp:ListItem>
            <asp:ListItem value="MUS">Mauritius</asp:ListItem>
            <asp:ListItem value="MYT">Mayotte</asp:ListItem>
            <asp:ListItem value="MEX">Mexico</asp:ListItem>
            <asp:ListItem value="FSM">Micronesia, Federated States of</asp:ListItem>
            <asp:ListItem value="MDA">Moldova, Republic of</asp:ListItem>
            <asp:ListItem value="MCO">Monaco</asp:ListItem>
            <asp:ListItem value="MNG">Mongolia</asp:ListItem>
            <asp:ListItem value="MNE">Montenegro</asp:ListItem>
            <asp:ListItem value="MSR">Montserrat</asp:ListItem>
            <asp:ListItem value="MAR">Morocco</asp:ListItem>
            <asp:ListItem value="MOZ">Mozambique</asp:ListItem>
            <asp:ListItem value="MMR">Myanmar</asp:ListItem>
            <asp:ListItem value="NAM">Namibia</asp:ListItem>
            <asp:ListItem value="NRU">Nauru</asp:ListItem>
            <asp:ListItem value="NPL">Nepal</asp:ListItem>
            <asp:ListItem value="NLD">Netherlands</asp:ListItem>
            <asp:ListItem value="NCL">New Caledonia</asp:ListItem>
            <asp:ListItem value="NZL">New Zealand</asp:ListItem>
            <asp:ListItem value="NIC">Nicaragua</asp:ListItem>
            <asp:ListItem value="NER">Niger</asp:ListItem>
            <asp:ListItem value="NGA">Nigeria</asp:ListItem>
            <asp:ListItem value="NIU">Niue</asp:ListItem>
            <asp:ListItem value="NFK">Norfolk Island</asp:ListItem>
            <asp:ListItem value="MNP">Northern Mariana Islands</asp:ListItem>
            <asp:ListItem value="NOR">Norway</asp:ListItem>
            <asp:ListItem value="OMN">Oman</asp:ListItem>
            <asp:ListItem value="PAK">Pakistan</asp:ListItem>
            <asp:ListItem value="PLW">Palau</asp:ListItem>
            <asp:ListItem value="PSE">Palestinian Territory, Occupied</asp:ListItem>
            <asp:ListItem value="PAN">Panama</asp:ListItem>
            <asp:ListItem value="PNG">Papua New Guinea</asp:ListItem>
            <asp:ListItem value="PRY">Paraguay</asp:ListItem>
            <asp:ListItem value="PER">Peru</asp:ListItem>
            <asp:ListItem value="PHL">Philippines</asp:ListItem>
            <asp:ListItem value="PCN">Pitcairn</asp:ListItem>
            <asp:ListItem value="POL">Poland</asp:ListItem>
            <asp:ListItem value="PRT">Portugal</asp:ListItem>
            <asp:ListItem value="PRI">Puerto Rico</asp:ListItem>
            <asp:ListItem value="QAT">Qatar</asp:ListItem>
            <asp:ListItem value="REU">R궮ion</asp:ListItem>
            <asp:ListItem value="ROU">Romania</asp:ListItem>
            <asp:ListItem value="RUS">Russian Federation</asp:ListItem>
            <asp:ListItem value="RWA">Rwanda</asp:ListItem>
            <asp:ListItem value="BLM">Saint Barthꭥmy</asp:ListItem>
            <asp:ListItem value="SHN">Saint Helena, Ascension and Tristan da Cunha</asp:ListItem>
            <asp:ListItem value="KNA">Saint Kitts and Nevis</asp:ListItem>
            <asp:ListItem value="LCA">Saint Lucia</asp:ListItem>
            <asp:ListItem value="MAF">Saint Martin (French part)</asp:ListItem>
            <asp:ListItem value="SPM">Saint Pierre and Miquelon</asp:ListItem>
            <asp:ListItem value="VCT">Saint Vincent and the Grenadines</asp:ListItem>
            <asp:ListItem value="WSM">Samoa</asp:ListItem>
            <asp:ListItem value="SMR">San Marino</asp:ListItem>
            <asp:ListItem value="STP">Sao Tome and Principe</asp:ListItem>
            <asp:ListItem value="SAU">Saudi Arabia</asp:ListItem>
            <asp:ListItem value="SEN">Senegal</asp:ListItem>
            <asp:ListItem value="SRB">Serbia</asp:ListItem>
            <asp:ListItem value="SYC">Seychelles</asp:ListItem>
            <asp:ListItem value="SLE">Sierra Leone</asp:ListItem>
            <asp:ListItem value="SGP">Singapore</asp:ListItem>
            <asp:ListItem value="SXM">Sint Maarten (Dutch part)</asp:ListItem>
            <asp:ListItem value="SVK">Slovakia</asp:ListItem>
            <asp:ListItem value="SVN">Slovenia</asp:ListItem>
            <asp:ListItem value="SLB">Solomon Islands</asp:ListItem>
            <asp:ListItem value="SOM">Somalia</asp:ListItem>
            <asp:ListItem value="ZAF">South Africa</asp:ListItem>
            <asp:ListItem value="SGS">South Georgia and the South Sandwich Islands</asp:ListItem>
            <asp:ListItem value="SSD">South Sudan</asp:ListItem>
            <asp:ListItem value="ESP">Spain</asp:ListItem>
            <asp:ListItem value="LKA">Sri Lanka</asp:ListItem>
            <asp:ListItem value="SDN">Sudan</asp:ListItem>
            <asp:ListItem value="SUR">Suriname</asp:ListItem>
            <asp:ListItem value="SJM">Svalbard and Jan Mayen</asp:ListItem>
            <asp:ListItem value="SWZ">Swaziland</asp:ListItem>
            <asp:ListItem value="SWE">Sweden</asp:ListItem>
            <asp:ListItem value="CHE">Switzerland</asp:ListItem>
            <asp:ListItem value="SYR">Syrian Arab Republic</asp:ListItem>
            <asp:ListItem value="TWN">Taiwan, Province of China</asp:ListItem>
            <asp:ListItem value="TJK">Tajikistan</asp:ListItem>
            <asp:ListItem value="TZA">Tanzania, United Republic of</asp:ListItem>
            <asp:ListItem value="THA">Thailand</asp:ListItem>
            <asp:ListItem value="TLS">Timor-Leste</asp:ListItem>
            <asp:ListItem value="TGO">Togo</asp:ListItem>
            <asp:ListItem value="TKL">Tokelau</asp:ListItem>
            <asp:ListItem value="TON">Tonga</asp:ListItem>
            <asp:ListItem value="TTO">Trinidad and Tobago</asp:ListItem>
            <asp:ListItem value="TUN">Tunisia</asp:ListItem>
            <asp:ListItem value="TUR">Turkey</asp:ListItem>
            <asp:ListItem value="TKM">Turkmenistan</asp:ListItem>
            <asp:ListItem value="TCA">Turks and Caicos Islands</asp:ListItem>
            <asp:ListItem value="TUV">Tuvalu</asp:ListItem>
            <asp:ListItem value="UGA">Uganda</asp:ListItem>
            <asp:ListItem value="UKR">Ukraine</asp:ListItem>
            <asp:ListItem value="ARE">United Arab Emirates</asp:ListItem>
            <asp:ListItem value="GBR">United Kingdom</asp:ListItem>
            <asp:ListItem value="USA" selected>United States</asp:ListItem>
            <asp:ListItem value="UMI">United States Minor Outlying Islands</asp:ListItem>
            <asp:ListItem value="URY">Uruguay</asp:ListItem>
            <asp:ListItem value="UZB">Uzbekistan</asp:ListItem>
            <asp:ListItem value="VUT">Vanuatu</asp:ListItem>
            <asp:ListItem value="VEN">Venezuela, Bolivarian Republic of</asp:ListItem>
            <asp:ListItem value="VNM">Viet Nam</asp:ListItem>
            <asp:ListItem value="VGB">Virgin Islands, British</asp:ListItem>
            <asp:ListItem value="VIR">Virgin Islands, U.S.</asp:ListItem>
            <asp:ListItem value="WLF">Wallis and Futuna</asp:ListItem>
            <asp:ListItem value="ESH">Western Sahara</asp:ListItem>
            <asp:ListItem value="YEM">Yemen</asp:ListItem>
            <asp:ListItem value="ZMB">Zambia</asp:ListItem>
            <asp:ListItem value="ZWE">Zimbabwe</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="form-group">	
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <label class="control-label" for="textarea">Description</label><i class="mtrl-select"></i>
    </div>
    <div class="submit-btns">
        <asp:Button ID="Button1" class="mtr-btn" runat="server" Text="New" OnClick="Button1_Click" />
        <asp:Button ID="Button2" class="mtr-btn" runat="server" Text="Update" OnClick="Button2_Click" />
    </div>
</div>
</asp:Content>
